#!/usr/bin/env bash

cd /tmp

sudo cp /vagrant/artifacts/spark-profile.sh /etc/profile.d/spark.sh

# Spark
if [[ -a /vagrant/artifacts/spark-2.0.1-bin-hadoop2.3.tgz ]]; then
    cp /vagrant/artifacts/spark-2.0.1-bin-hadoop2.3.tgz /tmp/
else
    wget -q http://d3kbcqa49mib13.cloudfront.net/spark-2.0.1-bin-hadoop2.3.tgz
fi

tar -zxvf spark-2.0.1-bin-hadoop2.3.tgz

mv spark-2.0.1-bin-hadoop2.3 /usr/lib/

ln -s /usr/lib/spark-2.0.1-bin-hadoop2.3 /usr/lib/spark

cp /vagrant/artifacts/spark-env.sh /usr/lib/spark/conf/

chown vagrant:vagrant -R /usr/lib/spark-2.0.1-bin-hadoop2.3

mkdir -p /var/log/spark
chmod 777 /var/log/spark

#sudo /usr/lib/spark/sbin/start-master.sh
#sudo /usr/lib/spark/sbin/start-slaves.sh

