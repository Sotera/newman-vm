#
# Cookbook Name:: sotera-newman
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


template "/etc/security/limits.conf" do
  source "limits.conf.erb"
  owner 'root'
  group 'root'
end

