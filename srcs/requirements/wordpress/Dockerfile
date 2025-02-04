FROM debian:11.7

# Install required packages
RUN apt-get update && apt-get -y install \
    curl \
    php7.4-fpm \
    php7.4-mysqli \
    mariadb-client

# Download and install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the configuration of PHP-FPM
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# Create the directory to store the PHP-FPM socket
RUN mkdir -p /var/www/html /run/php \
    && chmod 755 /run/php \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copy the script to start the PHP-FPM service
COPY ./tools/wp.sh /usr/local/bin/wp.sh
RUN chmod +x /usr/local/bin/wp.sh

# Expose the port 9000 to connect to PHP-FPM
EXPOSE 9000

# Stablish the working directory
WORKDIR /var/www/html/

# Define the entrypoint
ENTRYPOINT [ "/usr/local/bin/wp.sh" ]
