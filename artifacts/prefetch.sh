#!/usr/bin/env bash

# Pre populate the artifacts

#grep wget * | sed -e 's/^[a-zA-Z0-9\.]*://'

if [[ ! -a MITIE-models-v0.2.tar.bz2 ]]; then 
    wget -O - http://sourceforge.net/projects/mitie/files/binaries/MITIE-models-v0.2.tar.bz2 > MITIE-models-v0.2.tar.bz2
fi 

if [[ ! -a elasticsearch-1.7.2.deb ]]; then 
    wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb
fi

if [[ ! -a spark-1.4.1-bin-hadoop2.3.tgz ]]; then 
    wget http://www.interior-dsgn.com/apache/spark/spark-1.4.1/spark-1.4.1-bin-hadoop2.3.tgz
fi

if [[ ! -a scala-2.11.7.tgz ]]; then
    wget  http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz
fi

if [[ ! -a cdh4-repository_1.0_all.deb ]]; then
    wget http://archive.cloudera.com/cdh4/one-click-install/precise/amd64/cdh4-repository_1.0_all.deb
fi


