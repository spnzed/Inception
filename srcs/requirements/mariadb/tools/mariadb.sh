#!/bin/bash

# Iniciar MariaDB en primer plano
mysqld_safe --datadir='/var/lib/mysql' &
PID=$!

# Esperar a que MariaDB esté disponible
while ! mysqladmin ping -h localhost --silent; do
    sleep 1
done

# Crear base de datos y usuario si no existen
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Dejar que el proceso de MariaDB continúe ejecutándose en primer plano
wait $PID
