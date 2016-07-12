#!/usr/bin/env bash


pushd /tmp/

# Scala
if [[ -a ../artifacts/scala-2.11.7.tgz ]]; then
    cp ../artifacts/scala-2.11.7.tgz /tmp/
else
    wget http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz
fi

sudo tar xvf scala-2.11.7.tgz
sudo mv scala-2.11.7 /opt/scala

popd
