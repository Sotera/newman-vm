package 'smt-client'

client_setup = "#{Chef::Config[:file_cache_path]}/clientSetup4SMT.sh"
register_log = '/root/.suse_register.log'

remote_file client_setup do
  action :create
  source "http://#{node['zypper']['smt_host']}/repo/tools/clientSetup4SMT.sh"
  mode 0544
  owner 'root'
  not_if { ::File.exist? register_log }
end

execute 'register_smt' do
  command "yes | #{client_setup} --host #{node['zypper']['smt_host']}"
  user 'root'
  creates register_log
  notifies :run, 'execute[initial_smt_agent]', :immediately
end

execute 'initial_smt_agent' do
  user 'root'
  command 'smt-agent'
  action :nothing
end
