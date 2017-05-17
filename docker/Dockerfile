#FROM docker:dind
#RUN apk update
#RUN apk add bash
#RUN apk add bash-completion
#RUN curl https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.gz | tar -C /usr/local --strip-components 1 -xzv
#RUN /usr/local/bin/npm i -g firmament

FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common curl
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update
RUN apt-get install -y docker-ce
RUN curl https://nodejs.org/dist/v6.9.4/node-v6.9.4-linux-x64.tar.gz | tar -C /usr/local --strip-components 1 -xzv
RUN /usr/local/bin/npm i -g firmament

RUN git config --global user.name nobody.nobody
RUN git config --global user.email nobody@nowhere.com

EXPOSE 8082

CMD ["/usr/bin/dockerd"]
