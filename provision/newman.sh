#!/usr/bin/env bash


printf "Installing \e[0;36mNewman\e[0m \n"

apt-get -y install python-igraph
apt-get -y install readpst
pip install mysql-connector-python --allow-external mysql-connector-python
pip install python-dateutil
pip install numpy
pip install jinja2

cd /srv/software 

wget -O - -o /dev/null https://github.com/Sotera/newman/archive/2.0.0.tar.gz | tar -zxvf -
ln -s newman-2.0.0 newman
