#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2008-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'iptables::_package'

service 'iptables' do
  action [:disable, :stop]
  supports status: true, start: true, stop: true, restart: true
  only_if { node['platform_family'] == 'rhel' }
end

# Necessary so that if iptables::disable is used and then later
# it is re-enabled without any rules changes, the templates will run the rebuilt script
directory '/etc/iptables.d' do
  action :delete
  recursive true
end
