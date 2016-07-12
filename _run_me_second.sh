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

. ../provision/java-repo.sh

. ../provision/os_config.sh

. ../provision/mysql.sh

. ../provision/java.sh

. ../provision/scala.sh

. ../provision/spark.sh

. ../provision/elasticsearch.sh

. ../provision/kibana.sh

. ../provision/tangelo.sh

#. ../provision/mitie.sh
#
#. ../provision/newman.sh
#
#. ../provision/newman-research.sh
#
#. ../provision/pst-extraction.sh
#
#. ../provision/docker.sh
#
#. ../provision/embed-map.sh
#
#. ../provision/cloudera-manager.sh
#
printf "fix permissions on /srv/software \n"
sudo chown -R vagrant.vagrant /srv/software
