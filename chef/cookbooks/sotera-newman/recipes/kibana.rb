# Install/configure Kibana
case node['platform']
  when 'ubuntu','debian'
    apt_repository 'kibana' do
      uri           'http://packages.elastic.co/kibana/4.5/debian'
      distribution  "stable"
      components    ['main']
      key           'https://packages.elastic.co/GPG-KEY-elasticsearch'
      action        :add
    end
  when 'centos|rhel|amazon'
    log "not supported!"
end

package "kibana" do
  action :upgrade
end


case node['platform']
  when 'ubuntu'
    case node['platform_version']
      when '16.04'
        execute 'systemd_reload_daemons' do
          command '/bin/systemctl daemon-reload'
        end

        execute 'systemd_enable_kibana' do
          command '/bin/systemctl enable kibana.service'
        end

      else
        execute 'systemv_enable_service' do
          command 'update-rc.d kibana defaults 95 10'
        end
    end
  when 'centos'
    log "not supported!"
  when 'rhel'
    log "not supported!"
end


template "/opt/kibana/config/kibana.yml" do
  source "kibana.yml.erb"
  action :create
  notifies :restart, "service[kibana]"
end

service "kibana" do
  supports :restart => true, :status => true
  action [:enable, :start]
end

