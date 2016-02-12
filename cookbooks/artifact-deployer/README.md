Artifact Deployer
---

[![Build Status](https://travis-ci.org/maoo/artifact-deployer.svg)](https://travis-ci.org/maoo/artifact-deployer) [![Gitter chat](https://badges.gitter.im/maoo/artifact-deployer.png)](https://gitter.im/maoo/artifact-deployer)

A Chef Cookbook that provides a simple way to download, unpack and patch artifacts.
Download is offered via

- Maven GAV coordinates
- HTTP Url
- File-system path
- S3 (file copy and bucket sync)

# Artifact sources
Configuration is done via Chef JSON attributes; hereby are examples for each source type.

## Maven artifacts

```
"artifacts": {
  "alfresco": {
      "enabled": true,
      "groupId": "org.alfresco",
      "artifactId": "alfresco",
      "type": "war",
      "version": "5.0.a",
      "destination": "/var/lib/tomcat7/webapps",
      "owner": "tomcat7"
  }
}
```
Downloads `alfresco` WAR artifact and copies as `/var/lib/tomcat7/webapps/alfresco.war`

You can add Maven Repositories as artifact sources defining `maven_repos` databag item, as follows:

```
{
  "id" : "my-repo",
  "url" : "https://my-repo.com/mvnrepo",
  "username" : "user",
  "password" : "pwd"
}
```
Check [test maven_repos](https://github.com/maoo/artifact-deployer/tree/master/test/integration/data_bags/maven_repos) databags for more samples.

## HTTP URL

```
"artifacts": {
  "junit": {
    "enabled": true,
    "url": "https://repo1.maven.org/maven2/junit/junit/4.9/junit-4.9.jar",
    "destination": "/var/lib/tomcat7/lib",
    "owner": "tomcat7"
  }
}
```
Downloads `junit-4.9.jar` and copies as `/var/lib/tomcat7/lib/junit.jar`

## File-system path

```
"artifacts": {
  "my-local-zip": {
    "enabled": true,
    "path": "/root/folder/my-zip.zip",
    "destination": "/opt",
    "owner": "myuser"
  }
}
```
Copies `/root/folder/my-zip.zip` into `/opt/my-local-zip.zip`

## S3

If you want to sync a bucket with a local folder

```
"artifacts": {
  "my-s3-bucket-folder": {
    "enabled": true,
    "s3_bucket" : "artifact-deployer-test",
    "destination": "/opt",
    "owner": "myuser"
  }
}
```
Creates `/opt/my-s3-bucket-folder` directory with all `s3://artifact-deployer-test` bucket contents in it

If you want to sync a bucket with a local folder

```
"artifacts": {
  "my-s3-zip": {
    "enabled": true,
    "s3_bucket" : "artifact-deployer-test",
    "s3_filename" : "keep-calm-and-daje-forte.png.zip",
    "destination": "/opt",
    "owner": "myuser"
  }
}
```
Downloads `keep-calm-and-daje-forte.png.zip` from `s3://artifact-deployer-test` bucket and copies as `/opt/my-s3-zip.zip`

You can specify AWS key and secret defining `awscli` databag item, as follows:

```
{
  "id" : "my-credentials",
  "aws_access_key_id" : "AKI*****************",
  "aws_secret_access_key" : "****************************************"
}
```
Check [test awscli](https://github.com/maoo/artifact-deployer/tree/master/test/integration/data_bags/awscli) databags for more samples.

# Unpacking and filtering
---

```
"artifacts": {
  "solr-home": {
    "enabled": true,
    "groupId": "org.alfresco",
    "artifactId": "alfresco-solr",
    "type": "zip",
    "version": "5.0.a",
    "destination": "/var/lib/tomcat7",
    "owner": "tomcat7",
    "unzip": true,
    "filtering_mode" : "replace",
    "properties" : {
      "archive-SpacesStore/conf/solrcore.properties" : [
        "alfresco.host" : "192.168.0.22",
        "solr.secureComms" : "none"
      ],
      "test.properties" : [
        "my.host" : "192.168.0.22",
        "filtering_mode" : "append"
      ]
    },
    "terms" : {
      "context.xml" : [
        "@@ALFRESCO_HOST@@" : "192.168.0.22"
      ]
    }
  }
}
```

Filtering can be used via ```terms``` or ```properties``` attributes defined within the artifact configuration; each of those contain a list of ```file path(String) => attributes(Map<String,String>)```, where
- *file path* is the path, within the unpacked ZIP file, of the file that needs to be patched
- *attributes* maps the original string with the new ones to be injected

When using ```terms```, each attribute's key is replaced with the attribute's value.

When using ```properties```, a file line starting with ```<key>=``` will be searched and replaced with ```<key>=<value>```; if the line doesn't exist, by default nothing will happen (unless ```filtering_mode``` is set to ```append```); if the file doesn't exist, it will be created.

```filtering_mode``` can be specified at artifact level or as an attribute of properties, as shown in the example above.

## Unpacking options

### Artifact name

The name of the file/folder fetched by artifact-deployer can be customised; by default it is the name of the JSON key (i.e `my-amp`), but you can override it using `destinationName` attribute:

```
"artifacts": {
    "my-amp": {
    "enabled": true,
    "path": "my-amp/target/my-amp.amp",
    "destinationName" : "my.amp"
    "destination": "/var/lib/tomcat7/amps",
    "owner": "tomcat7"
  }
}
```
#### Including a single sub-folder

You can only include one specific subfolder of a ZIP, using the following syntax:

```
"artifacts": {
  "keystore": {
    "enabled": true,
    "groupId" : "org.alfresco",
    "artifactId" : "alfresco-repository",
    "version" : "5.0.a",
    "destination": "/var/lib/tomcat7/keystore",
    "subfolder": "alfresco/keystore/\*",
    "owner": "tomcat7"
  }
}
```

# Unit testing
```
bundle update
bundle exec rake
```

# Integration testing
```
kitchen test
```
