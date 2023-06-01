#!/bin/bash

TOMCAT_LINK="https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.9/bin/apache-tomcat-10.1.9.tar.gz"
dir_name="apache-tomcat-10.1.9"

sudo yum update -y
sudo yum install java git wget -y

sudo cd /opt
sudo rm -rf apache-tomcat*
sudo wget $TOMCAT_LINK

sudo tar -xvzf $dir_name.tar.gz
sudo rm -rf $dir_name.tar.gz

sudo git clone https://github.com/aravind-etagi/tomcat-config.git
sudo cp tomcat-config/context.xml /opt/$dir_name/webapps/manager/META-INF/context.xml
sudo cp tomcat-config/context.xml /opt/$dir_name/webapps/host-manager/META-INF/context.xml
sudo cp tomcat-config/tomcat-users.xml /opt/$dir_name/conf/tomcat-users.xml
sudo rm -rf tomcat-config


sudo cd /opt/$dir_name

sudo sh bin/shartup.sh