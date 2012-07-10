#
# Author:: William Roe (<willroe@gmail.com>)
# Cookbook Name:: golang
# Recipe:: defualt
#
# Copyright 2012, William Roe
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

install_location = "/srv/golang/versions/#{node[:golang][:version]}"
arch = node["kernel"]["machine"] =~ /x86_64/ ? "amd64" : "386"
version = node[:golang][:version]

remote_file "#{Chef::Config[:file_cache_path]}/go-#{version}.tar.gz" do
  source "http://go.googlecode.com/files/go#{version}.linux-#{arch}.tar.gz"
  mode "0644"
  checksum node[:golang][version][arch][:checksum]
  not_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/go-#{version}.tar.gz") }
end

execute "tar -C #{install_location} --strip-components=1 -xzf #{Chef::Config[:file_cache_path]}/go-#{version}.tar.gz" do
  not_if { ::File.exists?(install_location) }
end

link "/usr/local/go" do
  action :delete
end

link "/usr/local/go" do
  to install_location
end
