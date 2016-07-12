#!/usr/bin/env bash

printf "Installing \e[0;36mpst-extraction\e[0m \n"

#install pst reader
sudo apt-get -y install readpst
sudo pip install https://github.com/mattgwwalker/msg-extractor/zipball/master


#install ole reader for .msg files
sudo pip install -U olefile

#install image clustering deps
sudo apt-get install -f -y python-numpy python-scipy python-matplotlib python-pandas python-sympy python-nose

sudo pip install scikit-image
sudo pip install -U scikit-learn
sudo pip install Pillow

#translation and text analysis utils
sudo pip install -U textblob
sudo python -m textblob.download_corpora

#phone number extraction 
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
pushd /srv/software/

sudo wget -O - -o /dev/null https://github.com/Sotera/pst-extraction/archive/master.tar.gz | tar -zxvf -

popd

# Install for local mode execution --  MITIE deps must be provided to spark on path
pushd /srv/software/pst-extraction-master/

ln -s /srv/software/MITIE/MITIE-models/english/ner_model.dat ner_model_english.dat
ln -s /srv/software/MITIE/MITIE-models/spanish/ner_model.dat ner_model_spanish.dat
ln -s /srv/software/MITIE/mitielib/libmitie.a libmitie.a
ln -s /srv/software/MITIE/mitielib/libmitie.so libmitie.so
ln -s /srv/software/MITIE/mitielib/mitie.py mitie.py

popd

pushd /srv/software/pst-extraction-master/

#setup location index
sudo ./bin/build_clavin_index.sh

#setup geoip index 
sudo ./bin/setup_geo2ip.sh

popd

#build and install the java tika extractor
pushd /srv/software/pst-extraction-master/spark-java/

sudo mvn clean package
cp target/newman-spark-tika-0.1-SNAPSHOT-jar-with-dependencies.jar ../lib/ 

popd
