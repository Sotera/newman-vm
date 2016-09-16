#!/usr/bin/env bash
#DEPRECATED - use flask

printf "Install \e[0;36mTangelo\e[0m \n"

sudo pip install -Iv tangelo==0.6.1

printf "Configure \e[0;36mTangelo\e[0m \n"

if [ ! -d /var/log/tangelo ]; then
    sudo mkdir -p /var/log/tangelo 
fi

sudo chmod 777 /var/log/tangelo -R 

sudo cp /vagrant/artifacts/tangelo.conf /etc/tangelo.conf
