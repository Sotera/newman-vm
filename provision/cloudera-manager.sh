#!/usr/bin/env bash

printf "Installing \e[0;36mCloudera Manager Daemons\e[0m \n"

if [[ -a ../artifacts/cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb ]]; then
    pushd /tmp/
    cp ../artifacts/cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb /tmp/
    popd
else
    pushd /tmp/
    sudo wget http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/pool/contrib/e/enterprise/cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb
    popd
fi

printf "Installing \e[0;36mCloudera Manager Agent\e[0m \n"

if [[ -a ../artifacts/cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb ]]; then
    pushd /tmp/
    cp ../artifacts/cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb /tmp/
    popd
else
    pushd /tmp/
    sudo wget http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm/pool/contrib/e/enterprise/cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb
    popd
fi

sudo dpkg -i /tmp/cloudera-manager-agent_5.4.7-1.cm547.p0.10~trusty-cm5_amd64.deb
sudo dpkg -i /tmp/cloudera-manager-daemons_5.4.7-1.cm547.p0.10~trusty-cm5_all.deb

sudo apt-get install -f -y

sudo update-rc.d cloudera-scm-agent disable
