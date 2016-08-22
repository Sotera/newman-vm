#!/usr/bin/env bash


printf "Install \e[0;36mTangelo\e[0m \n"

#sudo pip install -Iv tangelo==0.6.1

wget -q -P artifacts/ https://pypi.python.org/packages/be/d3/effad7fee1276f045ce0d449e052a1f2f082da75d91beafff8c808c02262/tangelo-0.6.1.tar.gz#md5=c3cc305c96a4ec1d1b83c92de46c966b
wget -q -P artifacts/ https://pypi.python.org/packages/03/4c/92f6ead7101ba4c0b46ead02f3fa70f32f066fbb2f62f654c84698f2afbf/CherryPy-3.8.0.tar.gz#md5=542b96b2cd825e8120e8cd822bc18f4b


sudo pip install artifacts/CherryPy-3.8.0.tar.gz
sudo pip install artifacts/tangelo-0.6.1.tar.gz

printf "Configure \e[0;36mTangelo\e[0m \n"
if [ ! -d /var/log/tangelo ]; then
    sudo mkdir -p /var/log/tangelo 
fi

sudo chmod 777 /var/log/tangelo -R 

sudo cp /vagrant/artifacts/tangelo.conf /etc/tangelo.conf
