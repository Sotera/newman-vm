#!/usr/bin/env bash

printf "Installing \e[0;36mpst-extraction\e[0m \n"

cd /srv/software

sudo wget -O - -o /dev/null https://github.com/Sotera/pst-extraction/archive/master.tar.gz | tar -zxvf -

/srv/software/pst-extraction-master/
cp /srv/software/MITIE/MITIE-models/english/ner_model.dat /srv/software/pst-extraction-master/
cp /srv/software/MITIE/mitielib/libmitie.* /srv/software/pst-extraction-master/
cp /srv/software/MITIE/mitielib/mitie.py /srv/software/pst-extraction-master/

