FROM spark-local 

MAINTAINER elliot.ickovic@soteradefense.com

EXPOSE 4040

RUN /bin/bash -c "cd /scripts/ \
  && wget http://apertium.projectjj.com/apt/install-nightly.sh \
  && chmod +x /scripts/install-nightly.sh \
  && /scripts/install-nightly.sh \
  && apt-get update \
  && apt-get -f -y install apertium-en-es \
  && pip install langdetect"

WORKDIR /srv/software/pst-extraction/

CMD ["spark-submit"]

