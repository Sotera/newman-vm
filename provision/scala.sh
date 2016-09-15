#!/usr/bin/env bash


cd /tmp/

# Scala
if [[ -a /vagrant/artifacts/scala-2.11.7.tgz ]]; then
    cp /vagrant/artifacts/scala-2.11.7.tgz /tmp/
else
    wget http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz
fi

sudo tar xvf scala-2.11.7.tgz
sudo mv scala-2.11.7 /opt/scala


