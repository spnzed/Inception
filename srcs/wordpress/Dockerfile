FROM debian:11

# Actualizar repositorios y agregar dependencias de PHP y WordPress
RUN apt-get update && apt-get install -y \
    php php-fpm php-mysqli php-json php-curl \
    curl wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

# Copiar el archivo de configuración de WordPress
COPY wp-config.php /var/www/html/

EXPOSE 9000

CMD ["php-fpm", "-F"]