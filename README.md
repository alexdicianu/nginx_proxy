# nginx_proxy

## Description

Simple proxy based on nginx that forwards all requests to a predefined host. Among other things, if you're running docker or other container technologies, it will allow you to have a single outbound IP. If your host has a static IP, IP-based security schemes can be implemented based on it.

## Installation

### Self signed certificate

Installation requires creating an `ssl` directory and generating the self-signed certificate.

```
$ mkdir ssl
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/server.key -out ssl/server.crt
```

### Adding the right backend

Before running the image, you need to edit the `site.conf` configuration file and set the right value for both `proxy_pass` values (even though you only see the homepage, Nginx will know to forward any path you give it to the proxy_pass host).

### Generating the username and password

For improved security, the proxy server is password protected. To use it, you just need to generate a new `.htpasswd` file.

```
sudo htpasswd -c .htpasswd YOUR_USERNAME
```

The tool will prompt you for a password.

```
New password:
Re-type new password:
Adding password for user YOUR_USERNAME
```

### Running the docker image

```
$ docker build -t YOUR_DOCKER_USERNAME/nginx_proxy .
$ docker run -d -t -p 80:80 -p 443:443 --name nginx_proxy YOUR_DOCKER_USERNAME/nginx_proxy
```

## Workflow

To test it out, you can run the curl commands below, replacing them with the username and password you generated earlier. Also, the `$(docker-machine ip default)` part can be replaced with the actual server IP or domain name.

HTTP

```
$ curl -v http://YOUR_USERNAME:YOUR_PASSWORD@$(docker-machine ip default)/
```

HTTPS
```
$ curl -vk https://YOUR_USERNAME:YOUR_PASSWORD@$(docker-machine ip default)/
```
