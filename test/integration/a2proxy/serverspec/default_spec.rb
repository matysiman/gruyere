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

require "spec_helper"

describe file("/opt/gruyere") do
  it { should be_directory}
end

describe file("/etc/init.d/gruyere") do
  it { should be_file}
end

describe file("/opt/gruyere/gruyere.py") do
  it { should be_file}
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe service('gruyere') do
  it { should be_enabled }
  it { should be_running }
end