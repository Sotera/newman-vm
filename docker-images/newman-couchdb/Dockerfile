FROM klaemo/couchdb:latest

COPY local.ini /usr/local/etc/couchdb/

RUN mkdir -p /var/lib/couchdb/data/ \
 && chown -R couchdb:couchdb /var/lib/couchdb/data/ \
 && chmod -R g+rw /var/lib/couchdb/data/ \
 && apt-get -y install curl

