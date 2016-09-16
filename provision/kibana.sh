#!/usr/bin/env bash

printf "Installing \e[0;36mKibana\e[0m \n"

sudo wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo echo "deb https://packages.elastic.co/kibana/4.6/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana.list
sudo apt-get update && sudo apt-get install kibana

#Configure kibana to automatically start during bootup
sudo update-rc.d kibana defaults 95 10