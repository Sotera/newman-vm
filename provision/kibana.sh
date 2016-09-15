#!/usr/bin/env bash

printf "Installing \e[0;36mKibana\e[0m \n"

sudo mkdir /kibana
sudo chown vagrant:vagrant /kibana
cd /kibana
sudo wget -q https://download.elastic.co/kibana/kibana/kibana-4.2.2-linux-x64.tar.gz
tar xf kibana-4.2.2-linux-x64.tar.gz

sudo chown -R vagrant:vagrant /kibana
