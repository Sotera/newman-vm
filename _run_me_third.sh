#!/usr/bin/env bash

printf "Embedding the make and installing cloudera ...\n"

pushd provision

. embed-map.sh

. cloudera-manager.sh

popd

printf "Pulling the Docker extraction support containers ...\n"
docker pull sotera/spark-local:0.9
docker tag sotera/spark-local:0.9 spark-local:latest
docker pull sotera/geo-utils:0.9
docker tag sotera/geo-utils:0.9 geo-utils:latest
docker pull sotera/apertium:0.9
docker tag sotera/apertium:0.9 apertium:latest
docker pull sotera/ocr:0.9
docker tag sotera/ocr:0.9 ocr:latest

printf "Fix permissions on /srv/software\n"
sudo chown -R vagrant.vagrant /srv/software

printf "Finished installing Newman!\n"
