#!/usr/bin/env bash

printf "Installing \e[0;36mnewman-research\e[0m \n"

#install the newman-research project
cd /srv/software

sudo wget -O - -o /dev/null https://github.com/Sotera/newman-research/archive/master.tar.gz | tar -zxvf -

