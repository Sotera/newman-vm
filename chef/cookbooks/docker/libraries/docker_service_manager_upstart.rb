module DockerCookbook
  class DockerServiceManagerUpstart < DockerServiceBase
    resource_name :docker_service_manager_upstart

    provides :docker_service_manager, platform: 'ubuntu'
    provides :docker_service_manager, platform: 'linuxmint'

    action :start do
      create_docker_wait_ready

      template "/etc/init/#{docker_name}.conf" do
        source 'upstart/docker.conf.erb'
        owner 'root'
        group 'root'
        mode '0644'
        variables(
          docker_name: docker_name,
          docker_daemon_arg: docker_daemon_arg,
          docker_wait_ready: "#{libexec_dir}/#{docker_name}-wait-ready"
        )
        cookbook 'docker'
        action :create
      end

      template "/etc/default/#{docker_name}" do
        source 'default/docker.erb'
        variables(
          config: new_resource,
          docker_daemon_opts: docker_daemon_opts.join(' ')
        )
        cookbook 'docker'
        notifies :restart, new_resource, :immediately
        action :create
      end

      service docker_name do
        provider Chef::Provider::Service::Upstart
        supports status: true
        action :start
      end
    end

    action :stop do
      service docker_name do
        provider Chef::Provider::Service::Upstart
        supports status: true
        action :stop
      end
    end

    action :restart do
      action_stop
      action_start
    end
  end
end
