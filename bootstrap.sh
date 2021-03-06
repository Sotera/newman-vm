#!/usr/bin/env bash


printf "Setup \e[0;36mLinux\e[0m \n"

. /vagrant/provision/java.sh

# igraph repo
add-apt-repository -y ppa:igraph/ppa 

apt-get -y update
apt-get -y upgrade

apt-get -y install zip
apt-get -y install p7zip-full
apt-get -y install pkg-config python-pip python-dev
apt-get -y install netcat git unzip
apt-get -y install htop
apt-get -y install iperf

mkdir -p /srv/software 
chmod 755 /srv/software 

. /vagrant/provision/os_config.sh

#. /vagrant/provision/mysql.sh

. /vagrant/provision/scala.sh

. /vagrant/provision/spark.sh

. /vagrant/provision/elasticsearch.sh

. /vagrant/provision/kibana.sh

. /vagrant/provision/tangelo.sh

. /vagrant/provision/mitie.sh

. /vagrant/provision/newman.sh

. /vagrant/provision/newman-research.sh

. /vagrant/provision/pst-extraction.sh

. /vagrant/provision/docker.sh

#. /vagrant/provision/embed-map.sh

#. /vagrant/provision/cloudera-manager.sh

cd /srv/software 
printf "fix permissions \n"
sudo chown vagrant:vagrant /srv/software -R 


