#!/bin/bash

date -u

sed -i "s/#port/port/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g" /dump_inception.sql

service mysql start  

mysql << eof
GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
quit
eof

db=$(mysql -e "use inception; show tables;")

if [ "$db" == "" ]
then
	echo "database not set yet"
	mysql < dump_inception.sql
else
	echo "database already set"
fi

service mysql stop

exec "$@"
