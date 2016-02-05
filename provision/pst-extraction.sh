#!/usr/bin/env bash

printf "Installing \e[0;36mpst-extraction\e[0m \n"

#install pst reader
sudo apt-get -y install readpst

#install image clustering deps
sudo apt-get install -f -y python-numpy python-scipy python-matplotlib python-pandas python-sympy python-nose

sudo pip install scikit-image
sudo pip install -U scikit-learn
sudo pip install Pillow

# 
sudo pip install phonenumbers

#exif reader
sudo pip install exifread

#install dill - multithread safe pickle, used for spam filtering 
sudo pip install dill

#install reverend bayesian classifier, used for spam filtering
sudo pip install reverend
#TODO pip probably works but should be tested
#cd /tmp
#sudo wget https://github.com/skorokithakis/Reverend/archive/master.zip
#sudo unzip master.zip
#sudo python ./Reverend-master/setup.py install

#install the pst-extraction project
cd /srv/software

sudo wget -O - -o /dev/null https://github.com/Sotera/pst-extraction/archive/master.tar.gz | tar -zxvf -

cp /srv/software/MITIE/MITIE-models/english/ner_model.dat /srv/software/pst-extraction-master/
cp /srv/software/MITIE/mitielib/libmitie.* /srv/software/pst-extraction-master/
cp /srv/software/MITIE/mitielib/mitie.py /srv/software/pst-extraction-master/


cd /srv/software/pst-extraction-master/

#setup location index
sudo ./bin/build_clavin_index.sh

#setup geoip index 
sudo ./bin/setup_geo2ip.sh
