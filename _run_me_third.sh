#!/usr/bin/env bash

printf "Embedding the make and installing cloudera ...\n"

pushd provision

. embed-map.sh

. cloudera-manager.sh

popd

printf "Fix permissions on /srv/software\n"
sudo chown -R vagrant.vagrant /srv/software

printf "Finished installing Newman!\n"
