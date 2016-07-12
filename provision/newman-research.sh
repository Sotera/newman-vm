#!/usr/bin/env bash

printf "Installing \e[0;36mnewman-research\e[0m \n"

#install the newman-research project
pushd /srv/software/

sudo wget -O - -o /dev/null https://github.com/Sotera/newman-research/archive/master.tar.gz | tar -zxvf -

popd

pushd /srv/software/newman-research-master/docker_opencv_spark_ocr

#Need this for spark job
sudo zip -r neuro.zip NeuroTools

sudo cp neuro.zip spark-newman-human-receipt-detection/

popd

