# encoding: utf-8
#
# Cookbook Name:: gruyere
# Recipe:: apache2_proxy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if platform_family?("debian")
  include_recipe "apt"
end

include_recipe "gruyere::default"
include_recipe "apache2"
include_recipe "apache2::mod_proxy_http"

apache_site "default" do
  enable false
end

web_app "gruyere" do
  cookbook "gruyere"
  enable true
  server_name node["gruyere"]["apache2"]["server_name"]
  server_aliases node["gruyere"]["apache2"]["server_aliases"]
end
