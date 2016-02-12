case node['platform_family']
when 'rhel'
  default['yum']['atrpms-source']['repositoryid'] = 'atrpms-source'
  default['yum']['atrpms-source']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms - Source'
  default['yum']['atrpms-source']['baseurl'] = 'http://dl.atrpms.net/src/el$releasever-$basearch/atrpms/stable'
  default['yum']['atrpms-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-source']['failovermethod'] = 'priority'
  default['yum']['atrpms-source']['gpgcheck'] = true
  default['yum']['atrpms-source']['enabled'] = false
  default['yum']['atrpms-source']['managed'] = false
when 'fedora'
  default['yum']['atrpms-source']['repositoryid'] = 'atrpms-source'
  default['yum']['atrpms-source']['description'] = 'Fedora Core $releasever - $basearch - ATrpms - Source'
  default['yum']['atrpms-source']['baseurl'] = 'http://dl.atrpms.net/src/f$releasever-$basearch/atrpms/stable'
  default['yum']['atrpms-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-source']['failovermethod'] = 'priority'
  default['yum']['atrpms-source']['gpgcheck'] = true
  default['yum']['atrpms-source']['enabled'] = false
  default['yum']['atrpms-source']['managed'] = false
end
