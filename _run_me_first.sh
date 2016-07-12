#!/usr/bin/env bash

printf "Attempting to create user & group \e[0;36m'vagrant'\e[0m \n"
sudo useradd -ms /bin/bash vagrant && sudo adduser vagrant sudo
printf "Enter new password for user \e[0;36m'vagrant'\e[0m \n"
sudo passwd vagrant
printf "One more time!\n"
su vagrant
cd ~
git clone https://github.com/sotera/newman-vm
cd ~/newman-vm
