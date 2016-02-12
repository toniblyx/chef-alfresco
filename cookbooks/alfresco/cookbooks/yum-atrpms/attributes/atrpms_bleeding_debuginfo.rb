case node['platform_family']
when 'rhel'
  default['yum']['atrpms-bleeding-debuginfo']['repositoryid'] = 'atrpms-bleeding-debuginfo'
  default['yum']['atrpms-bleeding-debuginfo']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms bleeding - Debug'
  default['yum']['atrpms-bleeding-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/el$releasever-$basearch/atrpms/bleeding'
  default['yum']['atrpms-bleeding-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-bleeding-debuginfo']['failovermethod'] = 'priority'
  default['yum']['atrpms-bleeding-debuginfo']['gpgcheck'] = true
  default['yum']['atrpms-bleeding-debuginfo']['enabled'] = false
  default['yum']['atrpms-bleeding-debuginfo']['managed'] = false
when 'fedora'
  default['yum']['atrpms-bleeding-debuginfo']['repositoryid'] = 'atrpms-bleeding-debuginfo'
  default['yum']['atrpms-bleeding-debuginfo']['description'] = 'Fedora Core $releasever - $basearch - ATrpms bleeding - Debug'
  default['yum']['atrpms-bleeding-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/f$releasever-$basearch/atrpms/bleeding'
  default['yum']['atrpms-bleeding-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-bleeding-debuginfo']['failovermethod'] = 'priority'
  default['yum']['atrpms-bleeding-debuginfo']['gpgcheck'] = true
  default['yum']['atrpms-bleeding-debuginfo']['enabled'] = false
  default['yum']['atrpms-bleeding-debuginfo']['managed'] = false
end
