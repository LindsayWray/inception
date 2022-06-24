#!bin/bash

# cp -r /tmp/mysql/* /var/lib/mysql/

chmod -R 755 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
mkdir -p /run/mysqld
chmod -R 755 /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]
then
    echo "Setting up db the first time" 

    # mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql


    # service mysql start && mysql -u root < cat setup.sql

    service mysql start && mysql -u root << END
    CREATE DATABASE IF NOT EXISTS wordpress;

    CREATE USER IF NOT EXISTS '$WP_ADMIN_USER'@'localhost' IDENTIFIED BY '$WP_ADMIN_PW';
    GRANT ALL PRIVILEGES ON *.* TO '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PW';

    CREATE USER IF NOT EXISTS '$WP_USER'@'localhost' IDENTIFIED BY '$WP_USER_PW';
    GRANT ALL PRIVILEGES ON *.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PW';

    ALTER USER 'root'@'localhost' IDENTIFIED BY '$WP_ROOT_PW';

    FLUSH PRIVILEGES;
END

    echo "Users created"
else
    echo "Already set up"
fi

# service mysql start
# mysqld --user=mysql                                  ### mysql server

# /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

mysqld
