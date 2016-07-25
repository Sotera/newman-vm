# encoding: UTF-8
#
# Cookbook Name:: system
# Library:: url_package
#
# Copyright 2012-2014, Chris Fordham
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

# This module provides a way of installing a package by URL
module URLPackage
  def self.provider(filename)
    # return suitable package provider based on file extension
    case filename.split('.').last.downcase
    when 'deb'
      pkg_prov = Chef::Provider::Package::Dpkg
    when 'rpm'
      pkg_prov = Chef::Provider::Package::Rpm
    when 'gem'
      pkg_prov = Chef::Provider::Package::Rubygems
    when 'xz'
      pkg_prov = Chef::Provider::Package::Pacman
    else
      pkg_prov = Chef::Provider::Package
    end
    pkg_prov
  end

  def self.filename(url)
    require 'uri'

    # get filename from URL
    pkg_file = ::File.basename(URI.parse(url).path)
    pkg_file
  end
end
