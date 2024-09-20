#!/bin/sh

chown -R mysql:mysql /var/lib/mysql

service mariadb start
sleep 2

mariadb -hlocalhost -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -hlocalhost -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -hlocalhost -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -hlocalhost -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe