yum-atrpms Cookbook
============
[![Build Status](https://travis-ci.org/chef-cookbooks/yum-atrpms.svg?branch=master)](http://travis-ci.org/chef-cookbooks/yum-atrpms)
[![Cookbook Version](https://img.shields.io/cookbook/v/yum-atrpms.svg)](https://supermarket.chef.io/cookbooks/yum-atrpms)

The yum-atrpms cookbook takes over management of the default
repositoryids shipped with atrpms-release. It allows attribute
manipulation of `atrpms`, `atrpms-debuginfo`, `atrpms-source`,
`atrpms-testing`, `atrpms-testing-debuginfo`, `atrpms-testing-source`,
`atrpms-bleeding`, `atrpms-bleeding-debuginfo`, and `atrpms-bleeding-source`

Requirements
------------
#### Platforms
* RHEL/CentOS and derivatives
* Fedora

#### Chef
* Chef 11+

#### Cookbooks
* yum version 3.2.0 or higher


Attributes
----------
The following attributes are set by default

``` ruby
default['yum-atrpms']['repositories'] = %w(
  atrpms atrpms-debuginfo atrpms-source
  atrpms-testing atrpms-testing-debuginfo atrpms-testing-source
  atrpms-bleeding atrpms-bleeding-debuginfo atrpms-bleeding-source
)
```

``` ruby
default['yum']['atrpms']['repositoryid'] = 'atrpms'
default['yum']['atrpms']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms'
default['yum']['atrpms']['baseurl'] = 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable'
default['yum']['atrpms']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms']['failovermethod'] = 'priority'
default['yum']['atrpms']['gpgcheck'] = true
default['yum']['atrpms']['enabled'] = true
default['yum']['atrpms']['managed'] = true
```

``` ruby
default['yum']['atrpms-debuginfo']['repositoryid'] = 'atrpms-debuginfo'
default['yum']['atrpms-debuginfo']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms - Debug'
default['yum']['atrpms-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/el$releasever-$basearch/atrpms/stable'
default['yum']['atrpms-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-debuginfo']['failovermethod'] = 'priority'
default['yum']['atrpms-debuginfo']['gpgcheck'] = true
default['yum']['atrpms-debuginfo']['enabled'] = true
default['yum']['atrpms-debuginfo']['managed'] = true
```

``` ruby
default['yum']['atrpms-source']['repositoryid'] = 'atrpms-source'
default['yum']['atrpms-source']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms - Source'
default['yum']['atrpms-source']['baseurl'] = 'http://dl.atrpms.net/src/el$releasever-$basearch/atrpms/stable'
default['yum']['atrpms-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-source']['failovermethod'] = 'priority'
default['yum']['atrpms-source']['gpgcheck'] = true
default['yum']['atrpms-source']['enabled'] = true
default['yum']['atrpms-source']['managed'] = true
```

``` ruby
default['yum']['atrpms-testing']['repositoryid'] = 'atrpms-testing'
default['yum']['atrpms-testing']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms testing'
default['yum']['atrpms-testing']['baseurl'] = 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/testing'
default['yum']['atrpms-testing']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-testing']['failovermethod'] = 'priority'
default['yum']['atrpms-testing']['gpgcheck'] = true
default['yum']['atrpms-testing']['enabled'] = true
default['yum']['atrpms-testing']['managed'] = true
```

``` ruby
default['yum']['atrpms-testing-debuginfo']['repositoryid'] = 'atrpms-testing-debuginfo'
default['yum']['atrpms-testing-debuginfo']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms testing  - Debug'
default['yum']['atrpms-testing-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/el$releasever-$basearch/atrpms/testing'
default['yum']['atrpms-testing-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-testing-debuginfo']['failovermethod'] = 'priority'
default['yum']['atrpms-testing-debuginfo']['gpgcheck'] = true
default['yum']['atrpms-testing-debuginfo']['enabled'] = true
default['yum']['atrpms-testing-debuginfo']['managed'] = true
```

``` ruby
default['yum']['atrpms-testing-source']['repositoryid'] = 'atrpms-testing-source'
default['yum']['atrpms-testing-source']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms testing - Source'
default['yum']['atrpms-testing-source']['baseurl'] = 'http://dl.atrpms.net/src/el$releasever-$basearch/atrpms/testing'
default['yum']['atrpms-testing-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-testing-source']['failovermethod'] = 'priority'
default['yum']['atrpms-testing-source']['gpgcheck'] = true
default['yum']['atrpms-testing-source']['enabled'] = true
default['yum']['atrpms-testing-source']['managed'] = true
```

``` ruby
default['yum']['atrpms-bleeding']['repositoryid'] = 'atrpms-bleeding'
default['yum']['atrpms-bleeding']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms bleeding'
default['yum']['atrpms-bleeding']['baseurl'] = 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/bleeding'
default['yum']['atrpms-bleeding']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-bleeding']['failovermethod'] = 'priority'
default['yum']['atrpms-bleeding']['gpgcheck'] = true
default['yum']['atrpms-bleeding']['enabled'] = true
default['yum']['atrpms-bleeding']['managed'] = true
```

``` ruby
default['yum']['atrpms-bleeding-debuginfo']['repositoryid'] = 'atrpms-bleeding-debuginfo'
default['yum']['atrpms-bleeding-debuginfo']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms bleeding  - Debug'
default['yum']['atrpms-bleeding-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/el$releasever-$basearch/atrpms/bleeding'
default['yum']['atrpms-bleeding-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-bleeding-debuginfo']['failovermethod'] = 'priority'
default['yum']['atrpms-bleeding-debuginfo']['gpgcheck'] = true
default['yum']['atrpms-bleeding-debuginfo']['enabled'] = true
default['yum']['atrpms-bleeding-debuginfo']['managed'] = true
```

``` ruby
default['yum']['atrpms-bleeding-source']['repositoryid'] = 'atrpms-bleeding-source'
default['yum']['atrpms-bleeding-source']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms bleeding - Source'
default['yum']['atrpms-bleeding-source']['baseurl'] = 'http://dl.atrpms.net/src/el$releasever-$basearch/atrpms/bleeding'
default['yum']['atrpms-bleeding-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
default['yum']['atrpms-bleeding-source']['failovermethod'] = 'priority'
default['yum']['atrpms-bleeding-source']['gpgcheck'] = true
default['yum']['atrpms-bleeding-source']['enabled'] = true
default['yum']['atrpms-bleeding-source']['managed'] = true
```

Recipes
-------
* default - Walks through node attributes and feeds a yum_resource
  parameters. The following is an example a resource generated by the
  recipe during compilation.

```ruby
  yum_repository 'atrpms' do
    baseurl 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable'
    description 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms'
    enabled true
    gpgcheck true
    gpgkey 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  end
```

Usage Example
-------------
To disable the atrpms repository through a Role or Environment definition

```
default_attributes(
  :yum => {
    :atrpms => {
      :enabled => {
        false
       }
     }
   }
 )
```

Uncommonly used repositoryids are not managed by default. This is
speeds up integration testing pipelines by avoiding yum-cache builds
that nobody cares about. To enable the atrpms-testing repository with a
wrapper cookbook, place the following in a recipe:

```
node.default['yum']['atrpms-testing']['enabled'] = true
node.default['yum']['atrpms-testing']['managed'] = true
include_recipe 'yum-atrpms'
```

More Examples
-------------
Point the atrpms repositories at an internally hosted server.

```
node.default['yum']['atrpms']['enabled'] = true
node.default['yum']['atrpms']['mirrorlist'] = nil
node.default['yum']['atrpms']['baseurl'] = 'https://internal.example.com/atrpms/6/stable'
node.default['yum']['atrpms']['sslverify'] = false

include_recipe 'yum-atrpms'
```

License & Authors
-----------------

**Author:** Cookbook Engineering Team (<cookbooks@chef.io>)

**Copyright:** 2011-2015, Chef Software, Inc.
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
