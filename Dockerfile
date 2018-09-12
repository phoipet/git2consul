FROM node:10-alpine
MAINTAINER Phoipet <https://github.com/phoipet>

ENV CONSUL_IP=""
ENV CONSUL_PORT=""

RUN apk --update add git openssh
RUN npm install git2consul@0.12.13 --global 
RUN mkdir -p /etc/git2consul

ADD https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
ADD confd /etc/confd/

COPY run.sh /run.sh
RUN ["chmod", "+x", "/run.sh"]
ENTRYPOINT ["sh","/run.sh"]