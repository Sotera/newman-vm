python_package 'tangelo' do
  version node['sotera-newman']['python']['tangelo']
end

execute "mkdir -p /var/log/tangelo"
execute "chmod 755 -R /var/log/tangelo"

template "/etc/tangelo.conf" do
  source "tangelo.conf.erb"
  action :create
end

