FROM ubuntu:14.04
MAINTAINER Pantheon

# Update distro
RUN apt-get update -y
RUN apt-get install -y vim curl
RUN apt-get -y -q install nginx

# Basic config
ADD site.conf /etc/nginx/conf.d/site.conf
ADD nginx.conf /etc/nginx/nginx.conf
ADD .htpasswd /etc/nginx/.htpasswd
ADD ssl/ /etc/nginx/ssl

# Exposing ports
EXPOSE 80
EXPOSE 443

# Start nginx server
CMD nginx