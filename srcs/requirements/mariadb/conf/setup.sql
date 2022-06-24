CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS 'superuser'@'localhost' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'%' IDENTIFIED BY 'secret';

CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'pw';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY 'pw';

ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';

FLUSH PRIVILEGES;
