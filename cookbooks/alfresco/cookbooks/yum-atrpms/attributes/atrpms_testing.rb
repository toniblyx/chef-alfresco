case node['platform_family']
when 'rhel'
  default['yum']['atrpms-testing']['repositoryid'] = 'atrpms-testing'
  default['yum']['atrpms-testing']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms testing'
  default['yum']['atrpms-testing']['baseurl'] = 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/testing'
  default['yum']['atrpms-testing']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-testing']['failovermethod'] = 'priority'
  default['yum']['atrpms-testing']['gpgcheck'] = true
  default['yum']['atrpms-testing']['enabled'] = false
  default['yum']['atrpms-testing']['managed'] = false
when 'fedora'
  default['yum']['atrpms-testing']['repositoryid'] = 'atrpms-testing'
  default['yum']['atrpms-testing']['description'] = 'Fedora Core $releasever - $basearch - ATrpms testing'
  default['yum']['atrpms-testing']['baseurl'] = 'http://dl.atrpms.net/f$releasever-$basearch/atrpms/testing'
  default['yum']['atrpms-testing']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-testing']['failovermethod'] = 'priority'
  default['yum']['atrpms-testing']['gpgcheck'] = true
  default['yum']['atrpms-testing']['enabled'] = false
  default['yum']['atrpms-testing']['managed'] = false
end
