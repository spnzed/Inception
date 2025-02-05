#!/bin/bash

if [ -f ./wp-config.php ]; then
  echo "WordPress already exists"
else
  wp core download --allow-root
  wp config create \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=$MYSQL_HOSTNAME \
    --allow-root

  # Wait for MySQL
  until mysqladmin ping -h "$MYSQL_HOSTNAME" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    echo "Waiting for MySQL..."
    sleep 2
  done

  # Install WordPress
  wp core install \
    --url=$DOMAIN_NAME \
    --title="$WORDPRESS_TITLE" \
    --admin_user=$WORDPRESS_ADMIN \
    --admin_password=$WORDPRESS_ADMIN_PASS \
    --admin_email=$WORDPRESS_ADMIN_EMAIL \
    --skip-email \
    --allow-root

  # Create additional user
  wp user create \
    $WORDPRESS_USER \
    $WORDPRESS_EMAIL \
    --role=author \
    --user_pass=$WORDPRESS_USER_PASS \
    --allow-root

  # Install theme
  wp theme install astra --activate --allow-root
fi

exec php-fpm7.4 -F