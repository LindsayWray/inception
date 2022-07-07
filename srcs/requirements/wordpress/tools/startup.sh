#!bin/bash

mkdir -p /var/www/wordpress
cd /var/www/wordpress #go into volume


if [ ! -f /var/www/wordpress/wp-config.php ]
then
    wp core download --allow-root
    
    wp config create --allow-root  --path= --dbname=wordpress --dbuser=$WP_USER --dbpass=$WP_USER_PW --dbhost=mariadb --config-file=/var/www/wordpress/wp-config.php --skip-packages --skip-plugins 

    echo Created config

    wp core install --allow-root --url=https://$DOMAIN_NAME --path= --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PW --admin_email="lwray@student.codam.nl"

    wp user create --allow-root $WP_USER "wp-user@student.codam.nl" --user_pass=$WP_USER_PW
    chown -R www-data:www-data /var/www/wordpress
fi
echo "Wordpress started"
php-fpm7.3 -R -F #runs on the foreground as root

