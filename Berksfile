source "https://api.berkshelf.com"

# cookbook 'tomcat', git:'git@github.com:maoo/tomcat.git', tag: "v0.17.3-fork2"
cookbook 'tomcat', git:'git@github.com:maoo/tomcat.git' #avoid too many tomcat restarts

# Resolve transitive deps of artifact-deployer
cookbook 'maven', git:'https://github.com/maoo/maven.git', tag: "v1.2.0-fork"
cookbook 'file', git: 'https://github.com/jenssegers/chef-file.git', tag: "v1.0.0"

metadata
