#!/usr/bin/env bash

printf "Installing \e[0;36mApache Tika\e[0m \n"

sudo mkdir /srv/software/tika/
sudo chmod 777 /srv/software/tika

cd /srv/software/tika

wget http://apache.mirrors.lucidnetworks.net/tika/tika-app-1.6.jar

printf "99df0d8c3f6a2be498d275053e611fb5afdf0a9d  tika-app-1.6.jar" | sha1sum -c -

if [[ $? -ne 0 ]]; then
    printf "\e[0;31mApache Tika check sum failed\e[0m \n"
fi
