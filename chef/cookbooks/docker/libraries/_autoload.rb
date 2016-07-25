begin
  gem 'docker-api', '= 1.28.0'
rescue LoadError
  unless defined?(ChefSpec)
    run_context = Chef::RunContext.new(Chef::Node.new, {}, Chef::EventDispatch::Dispatcher.new)

    require 'chef/resource/chef_gem'

    docker = Chef::Resource::ChefGem.new('docker-api', run_context)
    docker.version '= 1.28.0'
    docker.run_action(:install)
  end
end
