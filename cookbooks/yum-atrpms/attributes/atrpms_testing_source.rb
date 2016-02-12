case node['platform_family']
when 'rhel'
  default['yum']['atrpms-testing-source']['repositoryid'] = 'atrpms-testing-source'
  default['yum']['atrpms-testing-source']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms testing - Source'
  default['yum']['atrpms-testing-source']['baseurl'] = 'http://dl.atrpms.net/src/el$releasever-$basearch/atrpms/testing'
  default['yum']['atrpms-testing-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-testing-source']['failovermethod'] = 'priority'
  default['yum']['atrpms-testing-source']['gpgcheck'] = true
  default['yum']['atrpms-testing-source']['enabled'] = false
  default['yum']['atrpms-testing-source']['managed'] = false
when 'fedora'
  default['yum']['atrpms-testing-source']['repositoryid'] = 'atrpms-testing-source'
  default['yum']['atrpms-testing-source']['description'] = 'Fedora Core $releasever - $basearch - ATrpms testing - Source'
  default['yum']['atrpms-testing-source']['baseurl'] = 'http://dl.atrpms.net/src/f$releasever-$basearch/atrpms/testing'
  default['yum']['atrpms-testing-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-testing-source']['failovermethod'] = 'priority'
  default['yum']['atrpms-testing-source']['gpgcheck'] = true
  default['yum']['atrpms-testing-source']['enabled'] = false
  default['yum']['atrpms-testing-source']['managed'] = false
end
