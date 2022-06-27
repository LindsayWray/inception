FROM debian:buster 

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install mariadb-server

COPY tools/startup.sh .
RUN chmod +x startup.sh

RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf 
RUN sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf 

EXPOSE 3306

CMD /startup.sh