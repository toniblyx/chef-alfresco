if node['artifact-deployer']['install_awscli']

  aws_region               = node['artifact-deployer']['awscli']['aws_region']
  credentials_databag      = node['artifact-deployer']['awscli']['credentials_databag']
  credentials_databag_item = node['artifact-deployer']['awscli']['credentials_databag_item']
  credentials_parent_path  = node['artifact-deployer']['awscli']['credentials_parent_path']
  aws_config_file          = "#{credentials_parent_path}/credentials"

  if node['artifact-deployer']['force_awscli_commandline_install']
    package 'python-pip' do
      action :install
    end

    execute "install-awscli" do
      command "pip install awscli"
      not_if "pip list | grep awscli"
    end
  else
    include_recipe 'python::default'
    python_pip "awscli"
  end

  directory credentials_parent_path do
    mode '0755'
    action :create
  end

  begin
    aws_credentials = data_bag_item(credentials_databag,credentials_databag_item)
    aws_config = "[default]
region=#{aws_region}
aws_access_key_id=#{aws_credentials['aws_access_key_id']}
aws_secret_access_key=#{aws_credentials['aws_secret_access_key']}"

    file aws_config_file do
      content aws_config
    end
  rescue
    Chef::Log.warn("Cannot find databag "+credentials_databag+" with item "+
    credentials_databag_item+"; skipping "+aws_config_file+ " file creation")
  end
end
