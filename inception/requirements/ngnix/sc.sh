#!/bin/bash

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 \
  -keyout  /etc/nginx/ssl/inc.key\
  -out /etc/nginx/ssl/inc.crt \
  -subj "/CN=oelboukh.42.fr"

nginx -g "daemon off;"

