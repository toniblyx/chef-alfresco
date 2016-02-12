case node['platform_family']
when 'rhel'
  default['yum']['atrpms-bleeding-source']['repositoryid'] = 'atrpms-bleeding-source'
  default['yum']['atrpms-bleeding-source']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms bleeding - Source'
  default['yum']['atrpms-bleeding-source']['baseurl'] = 'http://dl.atrpms.net/src/el$releasever-$basearch/atrpms/bleeding'
  default['yum']['atrpms-bleeding-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-bleeding-source']['failovermethod'] = 'priority'
  default['yum']['atrpms-bleeding-source']['gpgcheck'] = true
  default['yum']['atrpms-bleeding-source']['enabled'] = false
  default['yum']['atrpms-bleeding-source']['managed'] = false
when 'fedora'
  default['yum']['atrpms-bleeding-source']['repositoryid'] = 'atrpms-bleeding-source'
  default['yum']['atrpms-bleeding-source']['description'] = 'Fedora Core $releasever - $basearch - ATrpms bleeding - Source'
  default['yum']['atrpms-bleeding-source']['baseurl'] = 'http://dl.atrpms.net/src/f$releasever-$basearch/atrpms/bleeding'
  default['yum']['atrpms-bleeding-source']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-bleeding-source']['failovermethod'] = 'priority'
  default['yum']['atrpms-bleeding-source']['gpgcheck'] = true
  default['yum']['atrpms-bleeding-source']['enabled'] = false
  default['yum']['atrpms-bleeding-source']['managed'] = false
end
