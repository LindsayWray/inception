#!bin/bash

mkdir -p /var/www/wordpress
cd /var/www/wordpress


if [ ! -f /var/www/wordpress/wp-config.php ]
then
    wp core download --allow-root

    mysql -V

    #cp /wp-config.php /var/www/wordpress/wp-config.php
    wp config create --allow-root  --path= --dbname=wordpress --dbuser=$WP_USER --dbpass=$WP_USER_PW --dbhost=mariadb --config-file=/var/www/wordpress/wp-config.php --skip-packages --skip-plugins 

    echo Created config

    # env | grep WP
    # wp core install --allow-root --url=https://lwray.42.fr
    wp core install --allow-root --url=$WP_URL --path= --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PW --admin_email="lwray@student.codam.nl"

    chown -R www-data:www-data /var/www/wordpress
fi
echo "Wordpress started"
php-fpm7.3 -R -F

