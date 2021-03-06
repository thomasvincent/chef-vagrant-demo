#
# Cookbook Name:: apache2
# Attributes:: mod_auth_openid
#
# Copyright 2013, Chef Software, Inc.
# Copyright 2014-2016, Alexander van Zoest
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

# mod_auth_openids
default['apache']['allowed_openids'] = []
default['apache']['mod_auth_openid']['ref']        = 'v0.8'
default['apache']['mod_auth_openid']['version']    = '0.8'
default['apache']['mod_auth_openid']['source_url'] = "https://github.com/bmuller/mod_auth_openid/archive/#{node['apache']['mod_auth_openid']['ref']}.tar.gz"
default['apache']['mod_auth_openid']['cache_dir']  = '/var/cache/mod_auth_openid'
default['apache']['mod_auth_openid']['dblocation'] = "#{node['apache']['mod_auth_openid']['cache_dir']}/mod_auth_openid.db"

default['apache']['mod_auth_openid']['configure_flags'] =
  case node['platform_family']
  when 'freebsd'
    [
      'CPPFLAGS=-I/usr/local/include',
      'LDFLAGS=-I/usr/local/lib -lsqlite3',
    ]
  else
    []
  end
