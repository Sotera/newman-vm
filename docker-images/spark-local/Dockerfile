FROM ubuntu:14.04

MAINTAINER elliot.ickovic@soteradefense.com

ENV PATH $PATH:/usr/lib/spark/bin
ENV SPARK_HOME /usr/lib/spark

EXPOSE 4040

ADD ["java-repo.sh","java.sh","spark.sh","spark-env.sh","spark-profile.sh","/scripts/"]


RUN /bin/bash -c "apt-get update \
  && apt-get install -y python2.7-dev \
  && ln -s /usr/bin/python2.7 /usr/bin/python"

RUN /bin/bash -c "apt-get install -y python-pip"

RUN /bin/bash -c "apt-get install -y software-properties-common \
  && apt-get install -y python3-software-properties \
  && add-apt-repository -y ppa:igraph/ppa"


RUN /bin/bash -c "/scripts/java-repo.sh"
RUN /bin/bash -c "/scripts/java.sh"
RUN /bin/bash -c "/scripts/spark.sh"

WORKDIR /srv/software/pst-extraction/

CMD ["spark-submit"]

