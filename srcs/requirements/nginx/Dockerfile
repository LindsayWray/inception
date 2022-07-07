FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install nginx openssl


COPY /conf/nginx.conf /etc/nginx/sites-available/lwray.42.fr
# The sites-available folder is for storing all of your vhost configurations,
# whether or not they're currently enabled.
# The sites-enabled folder contains symlinks to files in the sites-available folder.
# This allows you to selectively disable vhosts by removing the symlink.
RUN ln -s /etc/nginx/sites-available/lwray.42.fr /etc/nginx/sites-enabled/lwray.42.fr

#create key for encypted client-server communication and a certificate 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=lwray.42.fr"
RUN chmod 775 /etc/ssl/private/nginx-selfsigned.key
RUN chmod 775 /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 443

ENTRYPOINT echo "Running nginx" && nginx -g 'daemon off;'