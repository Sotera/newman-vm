#!/usr/bin/env bash



printf "Creating \e[0;36mtopic-clustering\e[0m \n"

cd /srv/software 

git clone https://github.com/mitll/topic-clustering

# patch
sudo cp /vagrant/artifacts/run_all.py /srv/software/topic-clustering/topic/


