if node['artifact-deployer']['install_maven']

  include_recipe "maven::default"

  m2_home         = node['maven']['m2_home']
  master_password = node['artifact-deployer']['maven']['master_password']
  repos_databag   = node['artifact-deployer']['maven']['repos_databag']
  attribute_repos = node['artifact-deployer']['maven']['repositories']

  maven_repos = []

  if attribute_repos
    attribute_repos.each do |repo_id,repo|
      mvnRepo = {}
      mvnRepo['id'] = repo_id
      repo.each do |param_name,param_value|
        mvnRepo[param_name] = param_value
      end
      maven_repos.push mvnRepo
    end
  end
  begin
    databag_repos = data_bag(repos_databag)

    if databag_repos
      databag_repos.each do |repo|
        repo_item = data_bag_item(repos_databag,repo)
        maven_repos.push repo_item
      end
    end
  rescue
    Chef::Log.warn("Cannot find databag "+repos_databag+"; skipping Maven installation")
  end

  template  "#{m2_home}/conf/settings.xml" do
    source  "settings.xml.erb"
    mode    0666
    owner   "root"
    group   "root"
    variables(
      :repos => maven_repos
    )
  end

  if !master_password.empty?
    directory  "/root/.m2" do
      mode    0666
      owner   "root"
      group   "root"
    end

    template  "/root/.m2/settings-security.xml" do
      source  "settings-security.xml.erb"
      mode    0666
      owner   "root"
      group   "root"
    end
  end

  link "/usr/bin/mvn" do
    to "/usr/local/maven/bin/mvn"
  end
end
