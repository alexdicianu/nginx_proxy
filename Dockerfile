FROM ubuntu:14.04
MAINTAINER Pantheon
RUN apt-get update -y

RUN apt-get install -y vim curl
RUN apt-get -y -q install nginx

ADD site.conf /etc/nginx/conf.d/site.conf
ADD nginx.conf /etc/nginx/nginx.conf

ADD ssl/ /etc/nginx/ssl

EXPOSE 80
EXPOSE 443

CMD nginx