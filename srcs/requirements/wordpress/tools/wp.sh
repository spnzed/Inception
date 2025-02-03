#!/bin/bash

sleep 5;
# Check if WordPress is already installed
if [ -f ./wp-config.php ]; then
    echo "WordPress already exists"
else
    # Download WordPress
    wp core download --allow-root
    if [ $? -ne 0 ]; then
        echo "Error: WordPress download failed"
        exit 1
    fi

    # Try to create wp-config.php
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
    if [ $? -ne 0 ]; then
        echo "Error: wp-config.php creation failed"
        exit 1
    fi

    # Install WordPress
    wp core install --url=$DOMAIN_NAME --title="$WORDPRESS_TITLE" --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASS --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
    if [ $? -ne 0 ]; then
        echo "Error: WordPress installation failed"
        exit 1
    fi

    # Create a user
    wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASS --allow-root
    if [ $? -ne  ]; then
        echo "Error: User creation failed"
        exit 1
    fi

    # Install and activate a theme
    wp theme install twentytwentyfour --activate --allow-root
    if [ $? -ne 0 ]; then
        echo "Error: Theme installation failed"
        exit 1
    fi
fi

/usr/sbin/php-fpm7.4 -F;
