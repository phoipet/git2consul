FROM node:10-alpine
MAINTAINER Phoipet <https://github.com/phoipet>

ENV CONSUL_IP="127.0.0.1"
ENV CONSUL_PORT="8500"

RUN addgroup -g 444 consul && \
    adduser --system --uid 444 -g consul consul

RUN apk --update add git openssh
RUN npm install git2consul@0.12.13 --global

ADD https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN mkdir -p /etc/git2consul
ADD confd /etc/confd/

USER consul

RUN mkdir /home/consul/git2consul
COPY run.sh /run.sh

ENTRYPOINT ["sh","/run.sh"]