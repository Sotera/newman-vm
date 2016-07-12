#!/usr/bin/env bash

printf "Setting up build directories so user 'vagrant' can build stuff ..."

sudo mkdir -p /srv/software 
sudo chmod 755 /srv/software 
sudo chown vagrant.vagrant /srv/software 

printf "Let's update and install some system software!"

sudo add-apt-repository -y ppa:igraph/ppa 

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install zip
sudo apt-get -y install p7zip-full
sudo apt-get -y install pkg-config python-pip python-dev
sudo apt-get -y install netcat git unzip
sudo apt-get -y install htop
sudo apt-get -y install iperf

printf "Now some more application specific stuff ..."

. /vagrant/provision/java-repo.sh

. /vagrant/provision/os_config.sh

. /vagrant/provision/mysql.sh

. /vagrant/provision/java.sh

. /vagrant/provision/scala.sh

. /vagrant/provision/spark.sh

. /vagrant/provision/elasticsearch.sh

. /vagrant/provision/kibana.sh

. /vagrant/provision/tangelo.sh

#. /vagrant/provision/mitie.sh
#
#. /vagrant/provision/newman.sh
#
#. /vagrant/provision/newman-research.sh
#
#. /vagrant/provision/pst-extraction.sh
#
#. /vagrant/provision/docker.sh
#
#. /vagrant/provision/embed-map.sh
#
#. /vagrant/provision/cloudera-manager.sh
#
printf "fix permissions on /srv/software \n"
sudo chown -R vagrant.vagrant /srv/software
