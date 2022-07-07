#!bin/bash

chmod -R 755 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql #install into volume

#send query with heredoc
service mysql start && mysql -u root << EOF  
    CREATE DATABASE IF NOT EXISTS wordpress;

    CREATE USER IF NOT EXISTS '$WP_ADMIN_USER'@'localhost' IDENTIFIED BY '$WP_ADMIN_PW';
    GRANT ALL PRIVILEGES ON *.* TO '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PW';

    CREATE USER IF NOT EXISTS '$WP_USER'@'localhost' IDENTIFIED BY '$WP_USER_PW';
    GRANT ALL PRIVILEGES ON *.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PW';

    ALTER USER 'root'@'localhost' IDENTIFIED BY '$WP_ROOT_PW';

    FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p$WP_ROOT_PW shutdown

mysqld #starts database server in foreground
