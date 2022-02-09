FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt install -y mariadb-server mariadb-client

COPY setup_mariadb.sh /
COPY config/dump_inception.sql /

ENTRYPOINT [ "bash", "setup_mariadb.sh" ]

CMD [ "mysqld_safe" ]
