case node['platform_family']
when 'rhel'
  default['yum']['atrpms-debuginfo']['repositoryid'] = 'atrpms-debuginfo'
  default['yum']['atrpms-debuginfo']['description'] = 'Red Hat Enterprise Linux $releasever - $basearch - ATrpms - Debug'
  default['yum']['atrpms-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/el$releasever-$basearch/atrpms/stable'
  default['yum']['atrpms-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-debuginfo']['failovermethod'] = 'priority'
  default['yum']['atrpms-debuginfo']['gpgcheck'] = true
  default['yum']['atrpms-debuginfo']['enabled'] = false
  default['yum']['atrpms-debuginfo']['managed'] = false
when 'fedora'
  default['yum']['atrpms-debuginfo']['repositoryid'] = 'atrpms-debuginfo'
  default['yum']['atrpms-debuginfo']['description'] = 'Fedora Core $releasever - $basearch - ATrpms - Debug'
  default['yum']['atrpms-debuginfo']['baseurl'] = 'http://dl.atrpms.net/debug/f$releasever-$basearch/atrpms/stable'
  default['yum']['atrpms-debuginfo']['gpgkey'] = 'http://ATrpms.net/RPM-GPG-KEY.atrpms'
  default['yum']['atrpms-debuginfo']['failovermethod'] = 'priority'
  default['yum']['atrpms-debuginfo']['gpgcheck'] = true
  default['yum']['atrpms-debuginfo']['enabled'] = false
  default['yum']['atrpms-debuginfo']['managed'] = false
end
