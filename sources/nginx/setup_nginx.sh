#!/bin/bash

date -u

sed -i "s/DOMAIN/$DOMAIN_NAME www.$DOMAIN_NAME/g" /etc/nginx/sites-available/default

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt -sha256 -days 365 -nodes -subj '/CN=inception'

exec "$@"
