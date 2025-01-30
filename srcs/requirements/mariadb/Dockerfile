FROM debian:11

# Actualizar los repositorios y añadir las dependencias necesarias
RUN apt-get update && apt-get install -y \
    mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Copiar el archivo de inicialización de la base de datos
COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld"]
