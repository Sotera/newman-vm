#!/usr/bin/env bash

sudo cp ../artifacts/spark-profile.sh /etc/profile.d/spark.sh
sudo cp ../artifacts/spark-env.sh /usr/lib/spark/conf/

# Spark
if [[ -a ../artifacts/spark-1.5.0-bin-hadoop2.3.tgz ]]; then
    cp ../artifacts/spark-1.5.0-bin-hadoop2.3.tgz /tmp/
else
    pushd /tmp/
    wget http://archive.apache.org/dist/spark/spark-1.5.0/spark-1.5.0-bin-hadoop2.3.tgz
    popd
fi

pushd /tmp/

tar -zxvf spark-1.5.0-bin-hadoop2.3.tgz

sudo mv spark-1.5.0-bin-hadoop2.3 /usr/lib/

sudo ln -s /usr/lib/spark-1.5.0-bin-hadoop2.3 /usr/lib/spark

sudo useradd -ms /bin/bash vagrant && echo "vagrant:vagrant" | sudo chpasswd && sudo adduser vagrant sudo
sudo chown vagrant:vagrant -R /usr/lib/spark-1.5.0-bin-hadoop2.3

sudo mkdir -p /var/log/spark
sudo chmod 777 /var/log/spark

#sudo /usr/lib/spark/sbin/start-master.sh
#sudo /usr/lib/spark/sbin/start-slaves.sh

popd
