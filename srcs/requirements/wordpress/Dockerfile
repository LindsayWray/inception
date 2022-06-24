FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install php-fpm php-mysql wget mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar    ### download wordpress installer
RUN chmod u+x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' -i /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

# COPY conf/wp-config.php . # can remove config file, is created using wp cli
# COPY conf/php.ini .
COPY tools/startup.sh .
RUN chmod +x startup.sh

EXPOSE 9000

# RUN mkdir -p /var/www/wordpress
# RUN wp core download --allow-root
# CMD wp core install --allow-root --url=https://lwray.42.fr --path= --title="Inception" --admin_user=superuser --admin_email="lwray@student.codam.nl" --admin_password=secret && php-fpm7.3 -R -F
CMD ./startup.sh