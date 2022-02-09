#!/bin/bash

date -u

if [ ! -d /var/www/wordpress ]
then
	echo "wordpress directory not in /var/www/"
	unzip latest-fr_FR.zip
	mv index.php wordpress/
	mv wordpress /var/www/
	# echo "<?php echo phpinfo(); ?>" > /var/www/wordpress/index.php
else
	echo "wordpress directory already in /var/www/"
fi

if [ ! -f /var/www/wordpress/wp-config.php ]
then
	echo "wp-config.php not in /var/www/wordpress/"
	sed -i "s/WP_NAME/$MYSQL_DATABASE/g" wp-config.php
	sed -i "s/WP_USER/$MYSQL_USER/g" wp-config.php
	sed -i "s/WP_PASSWORD/$MYSQL_PASSWORD/g" wp-config.php
	mv wp-config.php /var/www/wordpress/
else
	echo "wp-config.php already in /var/www/wordpress/"
fi

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g" /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"
