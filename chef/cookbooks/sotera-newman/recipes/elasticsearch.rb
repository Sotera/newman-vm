elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type :package
  version "#{node['sotera-newman']['elasticsearch']['version']}"
  action :install
end

elasticsearch_configure 'elasticsearch' do
  allocated_memory "#{node['sotera-newman']['elasticsearch']['memory']}"
  configuration ({
      'cluster.name' => "#{node['sotera-newman']['elasticsearch']['cluster_name']}",
      'node.name' => "#{node['sotera-newman']['elasticsearch']['node_name']}",
      'http.port' => node['sotera-newman']['elasticsearch']['http_port']
  })
end

elasticsearch_service 'elasticsearch' do
  action :enabled, :started
end


elasticsearch_plugin 'head' do
  url 'mobz/elasticsearch-head'
end

elasticsearch_plugin 'carrot' do
  url 'carrot2/elasticsearch-carrot2/2.0.0'
end


execute "mkdir -p /etc/elasticsearch/scripts"
execute "mkdir -p /var/backups/elasticsearch"

template "/etc/elasticsearch/scripts/email_addr-sent-rcvd-sum.groovy" do
  source "email_addr-sent-rcvd-sum.groovy.erb"
  action :create
  notifies :restart, 'service[elasticsearch]'
end


service 'elasticsearch' do
  ensure :running
end