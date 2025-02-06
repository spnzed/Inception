# Use Debian 11.7 as the base image
FROM debian:11.7

# Update package lists and upgrade installed packages
RUN apt-get update && apt-get upgrade -y  

# Install necessary packages: curl, PHP 7.4 with FPM and MySQLi support, and MariaDB client
RUN apt-get install -y curl php7.4-fpm php7.4-mysqli mariadb-client

# Download WP-CLI, make it executable, and move it to a system-wide location
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the PHP-FPM configuration file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# Create the necessary directory for PHP-FPM runtime
RUN mkdir -p /run/php

# Set appropriate permissions for the PHP runtime directory
RUN chmod 755 /run/php

# Copy the custom WordPress initialization script
COPY ./tools/wp.sh /usr/local/bin/wp.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wp.sh

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the working directory to the web root
WORKDIR /var/www/html/

# Define the entrypoint to run the custom script on container start
ENTRYPOINT [ "/usr/local/bin/wp.sh" ]
