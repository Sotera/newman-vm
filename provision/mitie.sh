#!/usr/bin/env bash

su vagrant <<< "vagrant"

sudo apt-get -y install cmake
#apt-get -y install libopenblas-base libopenblas-dev

printf "Creating \e[0;36mMITIE\e[0m \n"

pushd /srv/software/
git clone https://github.com/mit-nlp/MITIE
popd

if [ -a ../artifacts/MITIE-models-v0.2.tar.bz2 ]; then
    cp ../artifacts/MITIE-models-v0.2.tar.bz2 /srv/software/MITIE/
    pushd /srv/software/MITIE/
    tar -xjf MITIE-models-v0.2.tar.bz2
    popd
else
    pushd /srv/software/MITIE/
    sudo make MITIE-models
    popd
fi 

if [ -a ../artifacts/MITIE-models-v0.2-Spanish.zip ]; then
    cp ../artifacts/MITIE-models-v0.2-Spanish.zip /srv/software/MITIE/
    pushd /srv/software/MITIE/
    unzip MITIE-models-v0.2-Spanish.zip
    popd
else
    pushd /srv/software/MITIE/
    sudo wget https://sourceforge.net/projects/mitie/files/binaries/MITIE-models-v0.2-Spanish.zip    
    unzip MITIE-models-v0.2-Spanish.zip
    popd
fi 

mkdir -p /srv/software/MITIE/tools/ner_stream/build
pushd /srv/software/MITIE/tools/ner_stream/build
sudo cmake ..
sudo cmake --build . --config Release
popd

pushd /srv/software/MITIE/mitielib
sudo make
mkdir build
cd build
sudo cmake ..
sudo cmake --build . --config Release --target install
popd
