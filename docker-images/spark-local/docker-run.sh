#!/usr/bin/env bash

docker run -ti --rm -P -v /srv/software/pst-extraction-master/:/srv/software/pst-extraction/ spark-local
