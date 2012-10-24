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

if node['platform'] == 'ubuntu'
  if node['lsb']['release'].to_f <= 12.04
    apt_repository "gophers-ppa" do
      uri "http://ppa.launchpad.net/gophers/go/ubuntu"
      distribution node['lsb']['codename']
      components ["main"]
      keyserver "keyserver.ubuntu.com"
      key "9AD198E9"
    end

    package "golang" do
      package_name "golang-#{node['golang']['release']}"
      action :install
    end
  else
    # Ubuntu Quantal+ is up-to-date with golang-stable
    # and the weekly/tip packages in the PPA are only
    # available for Precise and older Ubuntu releases
    package "golang"
  end
end
