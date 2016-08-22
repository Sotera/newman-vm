#!/usr/bin/env bash

printf "Installing \e[0;36mCloudera Manager Agent\e[0m \n"

cd /tmp

if [[ -a /vagrant/artifacts/cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb ]]; then
    cp /vagrant/artifacts/cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb /tmp/
else
    sudo wget -q http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/pool/contrib/e/enterprise/cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb
fi

sudo dpkg -i cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb


printf "Installing \e[0;36mCloudera Manager Daemons\e[0m \n"

if [[ -a /vagrant/artifacts/cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb ]]; then
    cp /vagrant/artifacts/cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb /tmp/
else
    sudo wget -q http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/pool/contrib/e/enterprise/cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb
fi

sudo dpkg -i cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb

sudo apt-get install -f -y

sudo update-rc.d cloudera-scm-agent disable

sudo service cloudera-scm-agent stop
echo manual | sudo tee /etc/init/cloudera-scm-agent.override
