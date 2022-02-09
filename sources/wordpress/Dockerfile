FROM debian:buster

EXPOSE 9000

RUN mkdir /run/php
RUN apt-get update && apt-get install -y wget unzip php php-fpm php-mysql

RUN wget https://fr.wordpress.org/latest-fr_FR.zip

COPY setup_wordpress.sh /
COPY config/wp-config.php /

ENTRYPOINT [ "bash", "setup_wordpress.sh" ]

CMD [ "php-fpm7.3", "-F" ]
