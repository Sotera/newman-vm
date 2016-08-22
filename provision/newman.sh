#!/usr/bin/env bash


printf "Installing \e[0;36mNewman\e[0m \n"

sudo apt-get -y install python-igraph
sudo pip install mysql-connector-python --allow-external mysql-connector-python
sudo pip install python-dateutil
sudo pip install numpy
sudo pip install jinja2

cd /srv/software 

mkdir p /vagrant/newman-ingester/

wget -O - -o /dev/null https://github.com/Sotera/newman/archive/dev-multi-dataset-pilot.tar.gz | tar -zxvf -
ln -s newman-dev-multi-dataset-pilot newman
