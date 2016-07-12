#!/usr/bin/env bash

printf "Installing \e[0;36mKibana\e[0m \n"

sudo mkdir /kibana
sudo chown vagrant:vagrant /kibana
pushd /kibana
sudo wget https://download.elastic.co/kibana/kibana/kibana-4.2.2-linux-x64.tar.gz
sudo tar xvf kibana-4.2.2-linux-x64.tar.gz

sudo chown -R vagrant:vagrant /kibana

popd
