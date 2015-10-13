#!/usr/bin/env bash

printf "Installing \e[0;36mElastic Search\e[0m \n"

cd /srv/software/

sudo wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb
sudo dpkg -i /srv/software/elasticsearch-1.7.2.deb

sudo mkdir /etc/elasticsearch/scripts
sudo echo "doc['sent_count'].value + doc['received_count'].value" >  /etc/elasticsearch/scripts/email_addr-sent-rcvd-sum.groovy

sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start


printf "Installing Python \e[0;36mElastic Search Package\e[0m \n"
sudo pip install elasticsearch
