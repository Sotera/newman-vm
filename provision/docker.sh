#!/usr/bin/env bash

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo cp /vagrant/artifacts/docker.list /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get purge lxc-docker

#install prereqs
sudo apt-get -y install linux-image-extra-$(uname -r)

sudo apt-get -y install docker-engine


sudo service docker start

#add docker group
sudo usermod -aG docker ubuntu
sudo usermod -aG docker vagrant 

