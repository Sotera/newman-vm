#!/usr/bin/env bash

apt-get update


sudo apt-get -y install cmake
sudo apt-get -y install libgfortran3
sudo apt-get -y install python-pip

sudo pip install mysql-connector-python
sudo pip install -Iv tangelo==0.6.1

printf "Configure \e[0;32mTangelo\e[0m \n"

if [ ! -d /var/log/tangelo ]; then
    sudo mkdir /var/log/tangelo 
fi

sudo chmod 777 /var/log/tangleo -R 

sudo cp /vagrant/artifacts/tangelo.conf /etc/tangelo.conf

printf "Adding \e[0;32mlouvain_to_gephi\e[0m \n"

cp /vagrant/artifacts/louvain_to_gephi.py /srv/software/distributed-louvain-modularity/louvain_to_gephi.py

sudo chown vagrant:vagrant /srv/software -R 

printf "Creating \e[0;32mMITIE\e[0m \n"

cd /srv/software 

git clone https://github.com/mitll/MITIE

cd /srv/software/MITIE

make MITIE-models

cd tools/ner_stream

mkdir build

cd build

cmake ..

cmake --build . --config Release

cd /srv/software/MITIE/mitielib

make

printf "Creating \e[0;32mtopic-clustering\e[0m \n"

cd /srv/software 

git clone https://github.com/mitll/topic-clustering

# patch
sudo cp /vagrant/artifacts/run_all.py /srv/software/topic-clustering/topic/


printf "Creating \e[0;32mActiveSearch\e[0m \n"

cd /srv/software 

git clone https://github.com/AutonlabCMU/ActiveSearch

cd /srv/software/ActiveSearch/Daemon 

mvn clean; mvn compile



