#!/usr/bin/env bash


printf "Creating \e[0;36mActiveSearch\e[0m \n"


apt-get -y install libgfortran3

mysql -uroot -proot -e "create database as_newman"
sudo cp /vagrant/artifacts/activesearch.cfg /etc/activesearch.cfg
sudo chmod 777 /etc/activesearch.cfg

sudo mkdir -p /tmp/activesearch/
sudo chmod 777 /tmp/activesearch/

cd /srv/software 

git clone https://github.com/AutonlabCMU/ActiveSearch

# cd /srv/software/ActiveSearch/Daemon 
# mvn clean; mvn compile
# mvn war:war 

sudo cp /srv/software/ActiveSearch/ActiveSearchDaemon.war /var/lib/tomcat7/webapps/

sudo /etc/init.d/tomcat7 restart
