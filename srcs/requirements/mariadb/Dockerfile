# # srcs/requirements/mariadb/Dockerfile
# FROM debian:bullseye

# RUN apt-get update && apt-get install -y \
#     mariadb-server \
#     && rm -rf /var/lib/apt/lists/*

# # Configuración para permitir conexiones remotas
# RUN mkdir -p /var/run/mysqld \
#     && chown -R mysql:mysql /var/run/mysqld \
#     && chmod 777 /var/run/mysqld

# COPY ./conf/server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./tools/mariadb.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/mariadb.sh

# EXPOSE 3306

# CMD ["mariadb.sh"]

# # srcs/requirements/mariadb/conf/server.cnf
# [mysqld]
# user                    = mysql
# pid-file               = /run/mysqld/mysqld.pid
# socket                 = /run/mysqld/mysqld.sock
# port                   = 3306
# basedir                = /usr
# datadir                = /var/lib/mysql
# tmpdir                 = /tmp
# bind-address           = 0.0.0.0

# # Configuración de caracteres
# character-set-server   = utf8mb4
# collation-server       = utf8mb4_general_ci

# # srcs/requirements/mariadb/tools/mariadb.sh
# #!/bin/bash

# # Iniciar el servicio de MySQL
# service mariadb start

# # Esperar a que MariaDB esté disponible
# while ! mysqladmin ping -h localhost --silent; do
#     sleep 1
# done

# # Crear base de datos y usuario si no existen
# mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
# mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"

# # Detener MariaDB para reiniciarla en primer plano
# mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

# # Iniciar MariaDB en primer plano
# exec mysqld_safe

# srcs/requirements/mariadb/Dockerfile
FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Configuración para permitir conexiones remotas
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

COPY ./conf/server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

EXPOSE 3306

CMD ["mariadb.sh"]