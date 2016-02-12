case node['platform_family']
when 'rhel'
  default['yum']['atrpms-bleeding']['repositoryid'] = 'atrpms-bleeding'
  default['yum']['atrpms-bleeding']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms bleeding'
  default['yum']['atrpms-bleeding']['baseurl'] = 'http://dl.atrpms.net/el$releasever-$basearch/atrpms/bleeding'
  default['yum']['atrpms-bleeding']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-bleeding']['failovermethod'] = 'priority'
  default['yum']['atrpms-bleeding']['gpgcheck'] = true
  default['yum']['atrpms-bleeding']['enabled'] = false
  default['yum']['atrpms-bleeding']['managed'] = false
when 'fedora'
  default['yum']['atrpms-bleeding']['repositoryid'] = 'atrpms-bleeding'
  default['yum']['atrpms-bleeding']['description'] = 'Fedora Core $releasever - $basearch - ATrpms bleeding'
  default['yum']['atrpms-bleeding']['baseurl'] = 'http://dl.atrpms.net/f$releasever-$basearch/atrpms/bleeding'
  default['yum']['atrpms-bleeding']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-bleeding']['failovermethod'] = 'priority'
  default['yum']['atrpms-bleeding']['gpgcheck'] = true
  default['yum']['atrpms-bleeding']['enabled'] = false
  default['yum']['atrpms-bleeding']['managed'] = false
end
