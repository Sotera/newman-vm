#!/usr/bin/env bash

apt-get update


sudo apt-get -y install cmake
sudo apt-get -y install libgfortran3
sudo apt-get -y install python-pip
sudo pip install mysql-connector-python
sudo pip install -Iv tangelo==0.6.1
sudo pip install elasticsearch
sudo apt-get -y install tomcat7

printf "Configure \e[0;36mTomcat\e[0m \n"

sudo cp /vagrant/artifacts/tomcat-server.xml /etc/tomcat7/server.xml
sudo cp /vagrant/artifacts/setenv.sh /usr/share/tomcat7/bin/
sudo chmod +x /usr/share/tomcat7/bin/setenv.sh

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


mysql -uroot -proot -e "create database as_newman"
sudo cp /vagrant/artifacts/activesearch.cfg /etc/activesearch.cfg
sudo chmod 777 /etc/activesearch.cfg

sudo mkdir -p /tmp/activesearch/
sudo chmod 777 /tmp/activesearch/

cd /srv/software 

git clone https://github.com/AutonlabCMU/ActiveSearch

# cd /srv/software/ActiveSearch/Daemon 
# mvn clean; mvn compile
# mvn war:war 

sudo cp /srv/software/ActiveSearch/ActiveSearchDaemon.war /var/lib/tomcat7/webapps/

sudo /etc/init.d/tomcat7 restart

printf "Installing \e[0;36mElastic Search\e[0m \n"

cd /srv/software/

sudo wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.deb
sudo dpkg -i elasticsearch-1.3.4.deb

sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start

printf "Installing \e[0;36mApache Tika\e[0m \n"

sudo mkdir /srv/software/tika/
sudo chmod 777 /srv/software/tika

cd /srv/software/tika

wget http://apache.mirrors.lucidnetworks.net/tika/tika-app-1.6.jar

printf "99df0d8c3f6a2be498d275053e611fb5afdf0a9d  tika-app-1.6.jar" | sha1sum -c -

if [[ $? -ne 0 ]]; then
    printf "\e[0;31mApache Tika check sum failed\e[0m \n"
fi


printf "Installing \e[0;36mNewman\e[0m \n"

cd /srv/software 

wget https://github.com/Sotera/newman/archive/v1.0-alpha.tar.gz

if [ -a /vagrant/artifacts/newman-1.0-alpha.tar.gz ]; then
    cp /vagrant/artifacts/newman-1.0-alpha.tar.gz /srv/software/
    tar -zxvf newman-1.0-alpha.tar.gz
    ln -s newman-1.0-alpha newman
else
    wget https://github.com/Sotera/newman/archive/v1.0-alpha.tar.gz
    tar -zxvf v1.0-alpha.tar.gz
fi 



cd /srv/software 
printf "fix permissions \n"
sudo chown vagrant:vagrant /srv/software -R 


