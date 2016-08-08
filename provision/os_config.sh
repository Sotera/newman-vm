#!/usr/bin/env bash

printf "Modifying OS config \e[0;36mSetting Limits\e[0m \n"

sudo cp ./artifacts/limits.conf /etc/security/limits.conf
