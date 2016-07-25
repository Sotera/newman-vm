include_recipe "users"

users_manage "#{node[:apt_repo][:freight][:repo_user]}" do
  action [ :create ]
end