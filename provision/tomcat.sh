#!/usr/bin/env bash

printf "Install \e[0;36mTomcat\e[0m \n"

sudo apt-get -y install tomcat7

printf "Configure \e[0;36mTomcat\e[0m \n"

sudo cp /vagrant/artifacts/tomcat-server.xml /etc/tomcat7/server.xml
sudo cp /vagrant/artifacts/setenv.sh /usr/share/tomcat7/bin/
sudo chmod +x /usr/share/tomcat7/bin/setenv.sh

sudo /etc/init.d/tomcat7 restart
