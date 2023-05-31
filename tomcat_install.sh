#!/bin/bash

TOMCAT_LINK="https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.9/bin/apache-tomcat-10.1.9.tar.gz"

sudo yum update -y > /dev/null
sudo yum install java git -y > /dev/null

sudo cd /opt
sudo rm -rf apache-tomcat*
sudo wget $TOMCAT_LINK
tar_name=`echo $TOMCAT_LINK | awk -F "/" {print$NF}`
sudo tar -xvzf $tar_name
sudo rm -rf $tar_name

dir_name=`echo $tar_name | awk -F ".tar" {print$1}`

sudo git clone https://github.com/aravind-etagi/tomcat-config.git
sudo cp ./tomcat-config/context.xml /opt/$dir_name/webapps/manager/META-INF/context.xml
sudo cp ./tomcat-config/context.xml /opt/$dir_name/webapps/host-manager/META-INF/context.xml
sudo cp ./tomcat-config/tomcat-users.xml /opt/$dir_name/conf/tomcat-users.xml
sudo rm -rf tomcat-config


cd /opt/$dir_name

sudo sh bin/shartup.sh