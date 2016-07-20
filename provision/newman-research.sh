#!/usr/bin/env bash

printf "Installing \e[0;36mnewman-research\e[0m \n"

#install the newman-research project
pushd /srv/software/

sudo wget -O - -o /dev/null https://github.com/Sotera/newman-research/archive/on-the-metal.tar.gz | tar -zxvf -
sudo mv newman-research-on-the-metal newman-research-master
popd

pushd /srv/software/newman-research-master/docker_opencv_spark_ocr

#Need this for spark job
sudo zip -r neuro.zip NeuroTools

sudo cp neuro.zip spark-newman-human-receipt-detection/

popd

