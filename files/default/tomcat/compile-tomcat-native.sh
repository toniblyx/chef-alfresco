#!/bin/bash

# This script is a very hacky way to install APR and Tomcat Native, as they're not shipped in Centos 6.7 yum repositories (one good reason to stay away from RPM distros and look for alternatives... it's a painful lock-in)

cd /tmp
# Install apr and apr-devel
wget  ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/efellows/CentOS_CentOS-6/x86_64/apr-1.4.6-10.3.x86_64.rpm
wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/efellows/CentOS_CentOS-6/x86_64/apr-devel-1.4.6-10.3.x86_64.rpm

rpm -i apr-1.4.6-10.3.x86_64.rpm
rpm -i apr-devel-1.4.6-10.3.x86_64.rpm

# Install tomcat-native
wget http://ftp.nluug.nl/internet/apache/tomcat/tomcat-connectors/native/1.2.2/source/tomcat-native-1.2.2-src.tar.gz
tar -zxvf tomcat-native-1.2.2-src.tar.gz
cd tomcat-native-1.2.2-src/native
./configure --with-apr=/usr/bin/apr-1-config
make
make install
ln -s /usr/local/apr/lib/libtcnative-1.so.0.2.2 /usr/lib/libtcnative-1.so
ln -s /usr/local/apr/lib/libtcnative-1.so.0.2.2 /usr/lib64/libtcnative-1.so
