FROM debian:11

# Actualizar y agregar dependencias de NGINX y OpenSSL
RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

# Copiar el archivo de configuración de NGINX
COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/nginx_start.sh /var/www

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT [ "var/www/nginx_start.sh" ]

CMD ["nginx", "-g", "daemon off;"]
