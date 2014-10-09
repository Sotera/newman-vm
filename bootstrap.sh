#!/usr/bin/env bash

apt-get update


sudo apt-get -y install cmake
sudo apt-get -y install libgfortran3
sudo apt-get -y install python-pip
sudo pip install mysql-connector-python
sudo pip install -Iv tangelo==0.6.1
sudo apt-get -y install tomcat7

printf "Configure \e[0;36mTomcat\e[0m \n"

sudo cp /vagrant/artifacts/tomcat-server.xml /etc/tomcat/server.xml
sudo /etc/init.d/tomcat7 restart

printf "Configure \e[0;36mTangelo\e[0m \n"

if [ ! -d /var/log/tangelo ]; then
    sudo mkdir /var/log/tangelo 
fi

sudo chmod 777 /var/log/tangelo -R 

sudo cp /vagrant/artifacts/tangelo.conf /etc/tangelo.conf

printf "Adding \e[0;36mlouvain_to_gephi\e[0m \n"

cp /vagrant/artifacts/louvain_to_gephi.py /srv/software/distributed-louvain-modularity/louvain_to_gephi.py

sudo chown vagrant:vagrant /srv/software -R 

printf "Creating \e[0;36mMITIE\e[0m \n"

cd /srv/software 

git clone https://github.com/mitll/MITIE

cd /srv/software/MITIE

if [ -a /vagrant/artifacts/MITIE-models-v0.2.tar.bz2 ]; then
    cp /vagrant/artifacts/MITIE-models-v0.2.tar.bz2 /srv/software/MITIE/
    tar -xjf MITIE-models-v0.2.tar.bz2
else
    make MITIE-models
fi 

cd tools/ner_stream

mkdir build

cd build

cmake ..

cmake --build . --config Release

cd /srv/software/MITIE/mitielib

make

printf "Creating \e[0;36mtopic-clustering\e[0m \n"

cd /srv/software 

git clone https://github.com/mitll/topic-clustering

# patch
sudo cp /vagrant/artifacts/run_all.py /srv/software/topic-clustering/topic/


printf "Creating \e[0;36mActiveSearch\e[0m \n"

cd /srv/software 

git clone https://github.com/AutonlabCMU/ActiveSearch

cd /srv/software/ActiveSearch/Daemon 

mvn clean; mvn compile

mvn war:war 

#mysql -uroot -proot -e "create database test_walker"

sudo mv /srv/software/ActiveSearch/Daemon/target/ActiveSearchDaemon.war /var/lib/tomcat7/webapps/

printf "fix permissions \n"
sudo chown vagrant:vagrant /srv/software -R 


