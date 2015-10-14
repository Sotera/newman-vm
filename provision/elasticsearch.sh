#!/usr/bin/env bash

printf "Installing \e[0;36mElastic Search\e[0m \n"

cd /tmp
if [[ -a /vagrant/artifacts/elasticsearch-1.7.2.deb ]]; then
    cp /vagrant/artifacts/elasticsearch-1.7.2.deb /tmp/
else
    sudo wget -q https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb
fi

sudo dpkg -i elasticsearch-1.7.2.deb

sudo mkdir -p /var/backups/elasticsearch
sudo mkdir /etc/elasticsearch/scripts
sudo echo "doc['sent_count'].value + doc['received_count'].value" >  /etc/elasticsearch/scripts/email_addr-sent-rcvd-sum.groovy
sudo cp /vagrant/artifacts/elasticsearch.yml /etc/elasticsearch/

sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start


printf "Installing Python \e[0;36mElastic Search Package\e[0m \n"
sudo pip install elasticsearch
