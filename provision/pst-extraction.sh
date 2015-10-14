#!/usr/bin/env bash


printf "Installing \e[0;36mpst-extraction\e[0m \n"

sudo cd /srv/software 

sudo wget -O - -o /dev/null https://github.com/Sotera/pst-extraction/archive/master.tar.gz | tar -zxvf -
