case node['platform_family']
when 'rhel'
  default['yum']['atrpms-testing-debuginfo']['repositoryid'] = 'atrpms-testing-debuginfo'
  default['yum']['atrpms-testing-debuginfo']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms testing - Debug'
  default['yum']['atrpms-testing-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/el$releasever-$basearch/atrpms/testing'
  default['yum']['atrpms-testing-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-testing-debuginfo']['failovermethod'] = 'priority'
  default['yum']['atrpms-testing-debuginfo']['gpgcheck'] = true
  default['yum']['atrpms-testing-debuginfo']['enabled'] = false
  default['yum']['atrpms-testing-debuginfo']['managed'] = false
when 'fedora'
  default['yum']['atrpms-testing-debuginfo']['repositoryid'] = 'atrpms-testing-debuginfo'
  default['yum']['atrpms-testing-debuginfo']['description'] = 'Fedora Core $releasever - $basearch - ATrpms testing - Debug'
  default['yum']['atrpms-testing-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/f$releasever-$basearch/atrpms/testing'
  default['yum']['atrpms-testing-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-testing-debuginfo']['failovermethod'] = 'priority'
  default['yum']['atrpms-testing-debuginfo']['gpgcheck'] = true
  default['yum']['atrpms-testing-debuginfo']['enabled'] = false
  default['yum']['atrpms-testing-debuginfo']['managed'] = false
end
