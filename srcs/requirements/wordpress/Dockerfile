FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install php-fpm php-mysql wget mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar    ### download wordpress cli
RUN chmod u+x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' -i /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

COPY tools/startup.sh .
COPY tools/wait_for_it.sh .
RUN chmod +x startup.sh
RUN chmod +x wait_for_it.sh

EXPOSE 9000

ENTRYPOINT ./wait_for_it.sh && ./startup.sh