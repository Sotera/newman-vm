FROM spark-local 

MAINTAINER elliot.ickovic@soteradefense.com

EXPOSE 4040

#Additional language packs available from Apertium by installing using command 
#apt-get -f -y install apertium-en-es  
#See the full list at  http://wiki.apertium.org/wiki/List_of_language_pairs
#

WORKDIR /scripts/
RUN wget http://apertium.projectjj.com/apt/install-nightly.sh
RUN chmod +x /scripts/install-nightly.sh
RUN /scripts/install-nightly.sh
#RUN apt-get --force-yes -y install apt-transport-https
#RUN apt-get --force-yes -y update
RUN apt-get --force-yes -y install apertium-en-es
RUN pip install langdetect

WORKDIR /srv/software/pst-extraction/

CMD ["spark-submit"]

