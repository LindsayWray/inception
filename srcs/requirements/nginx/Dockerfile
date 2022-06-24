FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install nginx openssl

# RUN rm -rf /etc/nginx/sites-available/*
COPY	/conf/nginx.conf /etc/nginx/sites-available/lwray.42.fr
RUN		ln -s /etc/nginx/sites-available/lwray.42.fr /etc/nginx/sites-enabled/lwray.42.fr

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=lwray.42.fr"
RUN chmod 775 /etc/ssl/private/nginx-selfsigned.key
RUN chmod 775 /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 443

CMD echo "Running nginx" && nginx -g 'daemon off;'