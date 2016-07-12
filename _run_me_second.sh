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

pushd provision
. java-repo.sh

. os_config.sh

. mysql.sh

. java.sh

. scala.sh

. spark.sh

. elasticsearch.sh

. kibana.sh

. tangelo.sh

#. mitie.sh
#
#. newman.sh
#
#. newman-research.sh
#
#. pst-extraction.sh
#
#. docker.sh
#
#. embed-map.sh
#
#. cloudera-manager.sh
#
popd

printf "fix permissions on /srv/software \n"
sudo chown -R vagrant.vagrant /srv/software
