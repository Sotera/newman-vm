#!/usr/bin/env bash

docker run -ti --rm -P -v /QCR/pst-extraction-master-temp/:/srv/software/pst-extraction/ spark-local
