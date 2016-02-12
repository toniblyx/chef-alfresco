#
# Cookbook Name:: tomcat
# Attributes:: default
#
# Copyright 2010, Chef Software, Inc.
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
node.default['tomcat']['base_version'] = 6
node.default['tomcat']['base_instance'] = "tomcat#{node['tomcat']['base_version']}"
node.default['tomcat']['packages'] = ["tomcat#{node['tomcat']['base_version']}"]
node.default['tomcat']['deploy_manager_packages'] = ["tomcat#{node['tomcat']['base_version']}-admin"]

case node['platform_family']

when 'rhel', 'fedora'
  suffix = node['tomcat']['base_version'].to_i < 7 ? node['tomcat']['base_version'] : ""

  node.default['tomcat']['base_instance'] = "tomcat#{suffix}"
  node.default['tomcat']['user'] = 'tomcat'
  node.default['tomcat']['group'] = 'tomcat'
  node.default['tomcat']['home'] = "/usr/share/tomcat#{suffix}"
  node.default['tomcat']['base'] = "/usr/share/tomcat#{suffix}"
  node.default['tomcat']['config_dir'] = "/etc/tomcat#{suffix}"
  node.default['tomcat']['log_dir'] = "/var/log/tomcat#{suffix}"
  node.default['tomcat']['tmp_dir'] = "/var/cache/tomcat#{suffix}/temp"
  node.default['tomcat']['work_dir'] = "/var/cache/tomcat#{suffix}/work"
  node.default['tomcat']['context_dir'] = "#{node["tomcat"]["config_dir"]}/Catalina/localhost"
  node.default['tomcat']['webapp_dir'] = "/var/lib/tomcat#{suffix}/webapps"
  node.default['tomcat']['lib_dir'] = "#{node["tomcat"]["home"]}/lib"
  node.default['tomcat']['endorsed_dir'] = "#{node["tomcat"]["lib_dir"]}/endorsed"
  node.default['tomcat']['packages'] = ["tomcat#{suffix}"]
  node.default['tomcat']['deploy_manager_packages'] = ["tomcat#{suffix}-admin-webapps"]
when 'debian'
  node.default['tomcat']['user'] = "tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['group'] = "tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['home'] = "/usr/share/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['base'] = "/var/lib/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['config_dir'] = "/etc/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['log_dir'] = "/var/log/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['tmp_dir'] = "/tmp/tomcat#{node["tomcat"]["base_version"]}-tmp"
  node.default['tomcat']['work_dir'] = "/var/cache/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['context_dir'] = "#{node["tomcat"]["config_dir"]}/Catalina/localhost"
  node.default['tomcat']['webapp_dir'] = "/var/lib/tomcat#{node["tomcat"]["base_version"]}/webapps"
  node.default['tomcat']['lib_dir'] = "#{node["tomcat"]["home"]}/lib"
  node.default['tomcat']['endorsed_dir'] = "#{node["tomcat"]["lib_dir"]}/endorsed"
when 'smartos'
  node.default['tomcat']['user'] = 'tomcat'
  node.default['tomcat']['group'] = 'tomcat'
  node.default['tomcat']['home'] = '/opt/local/share/tomcat'
  node.default['tomcat']['base'] = '/opt/local/share/tomcat'
  node.default['tomcat']['config_dir'] = '/opt/local/share/tomcat/conf'
  node.default['tomcat']['log_dir'] = '/opt/local/share/tomcat/logs'
  node.default['tomcat']['tmp_dir'] = '/opt/local/share/tomcat/temp'
  node.default['tomcat']['work_dir'] = '/opt/local/share/tomcat/work'
  node.default['tomcat']['context_dir'] = "#{node["tomcat"]["config_dir"]}/Catalina/localhost"
  node.default['tomcat']['webapp_dir'] = '/opt/local/share/tomcat/webapps'
  node.default['tomcat']['keytool'] = '/opt/local/bin/keytool'
  node.default['tomcat']['lib_dir'] = "#{node["tomcat"]["home"]}/lib"
  node.default['tomcat']['endorsed_dir'] = "#{node["tomcat"]["home"]}/lib/endorsed"
  node.default['tomcat']['packages'] = ["apache-tomcat"]
  node.default['tomcat']['deploy_manager_packages'] = []
else
  node.default['tomcat']['user'] = "tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['group'] = "tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['home'] = "/usr/share/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['base'] = "/var/lib/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['config_dir'] = "/etc/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['log_dir'] = "/var/log/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['tmp_dir'] = "/tmp/tomcat#{node["tomcat"]["base_version"]}-tmp"
  node.default['tomcat']['work_dir'] = "/var/cache/tomcat#{node["tomcat"]["base_version"]}"
  node.default['tomcat']['context_dir'] = "#{node["tomcat"]["config_dir"]}/Catalina/localhost"
  node.default['tomcat']['webapp_dir'] = "/var/lib/tomcat#{node["tomcat"]["base_version"]}/webapps"
  node.default['tomcat']['lib_dir'] = "#{node["tomcat"]["home"]}/lib"
  node.default['tomcat']['endorsed_dir'] = "#{node["tomcat"]["lib_dir"]}/endorsed"
end
