#!/usr/bin/env bash

printf "Installing \e[0;36mpst-extraction\e[0m \n"

cd /srv/software

sudo wget -O - -o /dev/null https://github.com/Sotera/pst-extraction/archive/newman-2.0.tar.gz | tar -zxvf -

cp /srv/software/MITIE/MITIE-models/english/ner_model.dat /srv/software/pst-extraction-newman-2.0/
cp /srv/software/MITIE/mitielib/libmitie.* /srv/software/pst-extraction-newman-2.0/
cp /srv/software/MITIE/mitielib/mitie.py /srv/software/pst-extraction-newman-2.0/


cd /srv/software/pst-extraction-newman-2.0/

#setup location index
sudo ./bin/build_clavin_index.sh

#setup geoip index 
sudo ./bin/setup_geo2ip.sh
