include_recipe "nginx"


directory "#{node[:apt_repo][:freight][:nginx][:sites_available_dir]}" do
  action :create
end

directory "#{node[:apt_repo][:freight][:nginx][:sites_enabled_dir]}" do
  action :create
end


# nginx  template
template "#{node[:apt_repo][:freight][:nginx][:sites_available_dir]}/#{node['hostname']}" do
  source "nginx_apt_repo_site.erb"
  action :create
  notifies :restart, "service[nginx]"
end

[ "default", "000-default" ].each do |file|
  link "/etc/nginx/sites-enabled/#{file}" do
    action :delete
    notifies :restart, "service[nginx]"
  end
end


link "/etc/nginx/sites-enabled/#{node['hostname']}" do
  to "/etc/nginx/sites-available/#{node['hostname']}"
  notifies :restart, "service[nginx]"
end
