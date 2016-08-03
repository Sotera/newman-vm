#!/usr/bin/env bash


printf "Install \e[0;36mTangelo\e[0m \n"

sudo pip install -Iv tangelo==0.7

printf "Configure \e[0;36mTangelo\e[0m \n"

if [ ! -d /var/log/tangelo ]; then
    sudo mkdir -p /var/log/tangelo 
fi

sudo chmod -R 777 /var/log/tangelo

sudo cp ../artifacts/tangelo.conf /etc/tangelo.conf
