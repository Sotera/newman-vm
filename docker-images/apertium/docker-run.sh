#!/usr/bin/env bash
#
# Run a local spark install but need to pass in script name as follows -- otherwise will just return as spark-submit help
# e.g. this will run the apertium translation 
#docker run -ti --rm -P -v /QCR/pst-extraction-master-temp/:/srv/software/pst-extraction/ apertium ./bin/run_spark_translation.sh

docker run -ti --rm -P -v /QCR/pst-extraction-master-temp/:/srv/software/pst-extraction/ apertium
