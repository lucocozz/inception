FROM debian:buster

EXPOSE 443

RUN apt-get update && apt-get install -y nginx openssl

COPY config/default /etc/nginx/sites-enabled/default
COPY setup_nginx.sh /

ENTRYPOINT [ "bash", "setup_nginx.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]
