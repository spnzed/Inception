FROM alpine:latest

RUN apk update && apk add --no-cache php php-fpm php-mysqli php-json curl

WORKDIR /var/www/html

COPY wp-config.php /var/www/html/

EXPOSE 9000

CMD ["php-fpm7", "-F"]

