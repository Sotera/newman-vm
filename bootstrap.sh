#!/usr/bin/env bash


printf "Setup \e[0;36mLinux\e[0m \n"

. /vagrant/provision/java-repo.sh

# igraph repo
add-apt-repository -y ppa:igraph/ppa 

apt-get -y update
apt-get -y upgrade

apt-get -y install pkg-config python-pip python-dev
apt-get -y install netcat git unzip
apt-get -y install htop

mkdir -p /srv/software 
chmod 755 /srv/software 

. /vagrant/provision/mysql.sh

. /vagrant/provision/java.sh

. /vagrant/provision/scala.sh

. /vagrant/provision/spark.sh

. /vagrant/provision/elasticsearch.sh

. /vagrant/provision/tangelo.sh

. /vagrant/provision/mitie.sh

. /vagrant/provision/newman.sh

cd /srv/software 
printf "fix permissions \n"
sudo chown vagrant:vagrant /srv/software -R 


