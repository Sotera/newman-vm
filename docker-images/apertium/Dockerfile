FROM spark-local 

MAINTAINER elliot.ickovic@soteradefense.com

EXPOSE 4040

#Additional language packs available from Apertium by installing using command 
#apt-get -f -y install apertium-en-es  
#See the full list at  http://wiki.apertium.org/wiki/List_of_language_pairs
#

RUN /bin/bash -c "cd /scripts/ \
  && wget http://apertium.projectjj.com/apt/install-nightly.sh \
  && chmod +x /scripts/install-nightly.sh \
  && /scripts/install-nightly.sh \
  && apt-get update \
  && apt-get -f -y install apertium-en-es \
  && pip install langdetect"

WORKDIR /srv/software/pst-extraction/

CMD ["spark-submit"]

