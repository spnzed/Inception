FROM debian:11.7

# Instalar dependencias necesarias
RUN apt-get update && apt-get -y install \
    curl \
    php7.4-fpm \
    php7.4-mysqli \
    mariadb-client

# Descargar y configurar WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copiar configuración de PHP-FPM
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# Crear y configurar los directorios necesarios
RUN mkdir -p /var/www/html /run/php \
    && chmod 755 /run/php \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copiar y dar permisos al script de WordPress
COPY ./tools/wp.sh /usr/local/bin/wp.sh
RUN chmod +x /usr/local/bin/wp.sh

# Exponer el puerto de PHP-FPM
EXPOSE 9000

# Establecer el directorio de trabajo
WORKDIR /var/www/html/

# Definir el punto de entrada
ENTRYPOINT [ "/usr/local/bin/wp.sh" ]
