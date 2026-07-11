#!/bin/bash

set -e

MYSQL_PASS=$(cat /run/secrets/db_password | tr -d '\n')
MYSQL_ROOT_PASS=$(cat /run/secrets/db_root_password | tr -d '\n')

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "MariaDB: Database will be set up..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    service mariadb start

    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
    mysql -uroot -p"${MYSQL_ROOT_PASS}" -e "FLUSH PRIVILEGES;"

    mysqladmin -uroot -p"${MYSQL_ROOT_PASS}" shutdown

    echo "MariaDB: Database is set up."
else
    echo "MariaDB: Database already set up. Skipped..."
fi

exec "$@"