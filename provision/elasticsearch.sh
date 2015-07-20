#!/usr/bin/env bash

printf "Installing \e[0;36mElastic Search\e[0m \n"

cd /srv/software/

sudo wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.0.deb
sudo dpkg -i /srv/software/elasticsearch-1.7.0.deb

sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start


printf "Installing Python \e[0;36mElastic Search Package\e[0m \n"
sudo pip install elasticsearch
