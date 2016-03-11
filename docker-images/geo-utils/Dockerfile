FROM spark-local 

MAINTAINER elliot.ickovic@soteradefense.com

EXPOSE 4040

RUN wget -qO- http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz |gzip -d - >/etc/GeoLite2-City.mmdb
RUN /bin/bash -c "pip install geoip2"

WORKDIR /srv/software/pst-extraction/

CMD ["spark-submit"]

