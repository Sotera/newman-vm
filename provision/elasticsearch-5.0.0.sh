#!/usr/bin/env bash

printf "Installing \e[0;36mElastic Search\e[0m \n"

cd /tmp
if [[ -a /vagrant/artifacts/elasticsearch-5.0.0-rc1.deb ]]; then
    cp /vagrant/artifacts/elasticsearch-5.0.0-rc1.deb /tmp/
else
    sudo wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.0-rc1.deb
fi

sudo dpkg -i elasticsearch-5.0.0-rc1.deb

sudo mkdir -p /var/backups/elasticsearch
sudo mkdir /etc/elasticsearch/scripts
sudo echo "doc['sent_count'].value + doc['received_count'].value" >  /etc/elasticsearch/scripts/email_addr-sent-rcvd-sum.groovy
sudo cp /vagrant/artifacts/elasticsearch.yml /etc/elasticsearch/

sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start

printf "Installing Python \e[0;36mElastic Search Package\e[0m \n"
sudo pip install elasticsearch --upgrade

#printf "Installing carrot2 \e[0;36mElastic Search Plugin\e[0m \n"
#sudo /usr/share/elasticsearch/bin/plugin install org.carrot2/elasticsearch-carrot2/2.4.0

#printf "Installing Head  \e[0;36mElastic Search Plugin\e[0m \n"
#sudo /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head

printf "Installing ICU Analysis \e[0;36mElastic Search Plugin\e[0m \n"
sudo bin/elasticsearch-plugin install analysis-icu

#printf "Installing delete-by-query \e[0;36mElastic Search Plugin\e[0m \n"
#sudo bin/plugin install delete-by-query

sudo /etc/init.d/elasticsearch restart
