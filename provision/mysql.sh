#!/usr/bin/env bash

printf "Install \e[0;36mMySQL\e[0m \n"

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get -y install mysql-server

