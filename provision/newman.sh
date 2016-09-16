#!/usr/bin/env bash


printf "Installing \e[0;36mNewman\e[0m \n"

sudo apt-get -y install python-igraph
sudo pip install python-dateutil
sudo pip install numpy
sudo pip install jinja2

cd /srv/software 

git clone https://github.com/Sotera/newman.git newman3
cd /srv/software/newman3/
git checkout newman-x3.x

cd /srv/software/
ln -s newman3 newman


#Install Virtualenv for use with flask
sudo apt-get -y install python-virtualenv

#Init the flask environment
cd newman3
./install-venv.sh
