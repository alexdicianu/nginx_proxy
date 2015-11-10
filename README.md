# nginx_proxy

## Description

Simple proxy based on nginx that forwards all requests to a predefined host. Among other things, if you're running docker or other container technologies, it will allow you to have a single outbound IP. If your host has a static IP, IP-based security schemes can be implemented based on it.

#### Table of Contents
* [Installation](#)
* [Example](#)

## Installation

Installation requires generating the self-signed certificate and running the docker image.

```
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/server.key -out ssl/server.crt
$ docker build -t YOUR_DOCKER_USERNAME/nginx_proxy .
$ docker run -d -t -p 80:80 -p 443:443 --name nginx_proxy YOUR_DOCKER_USERNAME/nginx_proxy
```

## Workflow

HTTP

```
$ curl -v http://$(docker-machine ip default)/
```

HTTPS
```
$ curl -vk https://$(docker-machine ip default)/
```