default['artifact-deployer']['install_maven'] = true
default['artifact-deployer']['install_awscli'] = true
default['artifact-deployer']['force_awscli_commandline_install'] = false

default['artifact-deployer']['restart_services'] = []
# default['restart_services'] = ['tomcat7']

default['artifact-deployer']['term_delimiter_start'] = "@@"
default['artifact-deployer']['term_delimiter_end'] = "@@"
default['artifact-deployer']['property_equals_sign'] = "="

default['artifact-deployer']['maven']['repos_databag'] = "maven_repos"
default['artifact-deployer']['maven']['master_password'] = ""
default['artifact-deployer']['maven']['purge_settings'] = false
default['artifact-deployer']['maven']['timeout'] = 600

default['artifact-deployer']['awscli']['aws_region'] = "us-east-1"
default['artifact-deployer']['awscli']['credentials_databag'] = "awscli"
default['artifact-deployer']['awscli']['credentials_databag_item'] = "credentials"
default['artifact-deployer']['awscli']['credentials_parent_path'] = "/root/.aws"
