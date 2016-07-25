#
# Cookbook Name:: apt-repo
# Recipe:: default
#
# Copyright 2016, Digital Synapse, LLC
#
# All rights reserved - Do Not Redistribute
#
chef_gem "chef-vault"
require 'chef-vault'


apt_repository 'freight' do
  uri        'http://packages.rcrowley.org'
  distribution 'trusty'
  arch 'amd64'
  components ['main']
  key 'http://packages.rcrowley.org/keyring.gpg'
end

node[:apt_repo][:freight][:packages].each do |pkg,ver|
  package pkg do
    if ver == "latest"
      action :upgrade
    else
      action ver
    end
    ignore_failure true
  end
end


template "/etc/freight.conf" do
  source "freight.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
                :freight_base_dir => node[:apt_repo][:freight][:freight_base_dir],
                :freight_gpg_key => node[:apt_repo][:freight][:freight_gpg_key]
            })
end

template "/home/#{node[:apt_repo][:freight][:repo_user]}/.freight-key" do
  source "freight-key.erb"
  owner "#{node[:apt_repo][:freight][:repo_user]}"
  group "#{node[:apt_repo][:freight][:repo_group]}"
end


# Install our keys to the servers
bsw_gpg_load_key_from_chef_vault 'master-private-key' do
  data_bag "#{node[:apt_repo][:freight][:master_gpg_private_key][:data_bag]}"
  item     "#{node[:apt_repo][:freight][:master_gpg_private_key][:item]}"
  json_key "#{node[:apt_repo][:freight][:master_gpg_private_key][:json_key]}"
  for_user "#{node[:apt_repo][:freight][:repo_user]}"
end

bsw_gpg_load_key_from_chef_vault 'master-public-key' do
  data_bag "#{node[:apt_repo][:freight][:master_gpg_public_key][:data_bag]}"
  item     "#{node[:apt_repo][:freight][:master_gpg_public_key][:item]}"
  json_key "#{node[:apt_repo][:freight][:master_gpg_public_key][:json_key]}"
  for_user "#{node[:apt_repo][:freight][:repo_user]}"
end

bsw_gpg_load_key_from_chef_vault 'signing-private-key' do
  data_bag "#{node[:apt_repo][:freight][:signing_gpg_private_key][:data_bag]}"
  item     "#{node[:apt_repo][:freight][:signing_gpg_private_key][:item]}"
  json_key "#{node[:apt_repo][:freight][:signing_gpg_private_key][:json_key]}"
  for_user "#{node[:apt_repo][:freight][:repo_user]}"
end



# Build /var/repositories directories
execute "mkdir -p #{node[:apt_repo][:freight][:freight_base_dir]}"
execute "mkdir -p #{node[:apt_repo][:freight][:freight_base_dir]}/cache/freight"


directory "#{node[:apt_repo][:freight][:freight_base_dir]}/freight" do
  owner "#{node[:apt_repo][:freight][:repo_user]}"
  group "#{node[:apt_repo][:freight][:repo_group]}"
  action :create
end


directory "/var/repositories/public" do
  owner "#{node[:apt_repo][:freight][:repo_user]}"
  group "#{node[:apt_repo][:freight][:repo_group]}"
  action :create
end

directory "/var/repositories/tmp" do
  owner "#{node[:apt_repo][:freight][:repo_user]}"
  group "#{node[:apt_repo][:freight][:repo_group]}"
  action :create
end

# Create symlink -- fix this!
link "#{node[:apt_repo][:freight][:freight_base_dir]}/public/apt" do
  to "#{node[:apt_repo][:freight][:freight_base_dir]}/cache/freight"
end

# clean up permissions and make sure /var/repositories is owned by our repo user
execute "set_apt_repo_permissions" do
  command "chown -R #{node[:apt_repo][:freight][:repo_user]}:#{node[:apt_repo][:freight][:repo_group]}  #{node[:apt_repo][:freight][:freight_base_dir]}"
end
