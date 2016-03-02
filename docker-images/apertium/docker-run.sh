#!/usr/bin/env bash
#
# run from anywhere but need to pass in script name
# e.g. 
#docker run -ti --rm -P -v /QCR/pst-extraction-master-temp/:/srv/software/pst-extraction/ apertium ./bin/run_spark_translate.sh

docker run -ti --rm -P -v /QCR/pst-extraction-master-temp/:/srv/software/pst-extraction/ apertium
