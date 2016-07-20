# -*- mode: ruby -*-

private_network_ip = '172.20.0.110'
username = %w{USER USERNAME}.map{|x|u=(ENV[x]||'').gsub(/[^\w]/,''); u unless u.empty?}.compact.first
if username.nil?
  puts 'ERROR: Could not determine username from environment'
  exit 1
end


VAGRANT_API_VERSION = '2'
Vagrant.configure(VAGRANT_API_VERSION) do |config|

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '8192']
    vb.customize ['modifyvm', :id, '--cpus', '2']
  end

  config.vm.hostname = "newman-#{username}"
  config.vm.network :private_network, ip: private_network_ip
  config.vm.box = 'opscode_ubuntu-14.04_chef-provisionerless.box'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'

  #config.vm.synced_folder ""
  
  config.vm.provision :shell, :inline => $preSetupScript

  config.vm.provision 'chef_solo' do |chef|
    chef.cookbooks_path = [ "./chef/cookbooks", "~/projects/sotera/chef-sotera/cookbooks" ]
    chef.roles_path = [ "./chef/roles", "~/projects/sotera/chef-sotera/roles" ]
    chef.data_bags_path = "~/projects/sotera/chef-sotera/data_bags"
    chef.environments_path = [ "~/projects/sotera/chef-sotera/environments" ]

    Dir["#{Pathname(__FILE__).dirname.join('roles')}/*.json"].each do |role|
      chef.add_role(role)
    end
  
    chef.json = {
      "vagrant" => "true"
    }
    
    chef.add_role "base_vagrant"
    chef.add_role "java_8"
    chef.add_recipe "sotera-newman::everything"
    #chef.add_role ""

    
  end
end
