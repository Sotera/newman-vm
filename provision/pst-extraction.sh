#!/usr/bin/env bash


printf "Installing \e[0;36mpst-extraction\e[0m \n"

cd /srv/software 

wget -O - -o /dev/null https://github.com/Sotera/pst-extraction/archive/master.tar.gz | tar -zxvf -
