# Usamos una imagen base de Debian
FROM debian:11.7

# Actualizamos los repositorios e instalamos Nginx y OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Exponemos el puerto 443 (HTTPS)
EXPOSE 443

# Copiamos los archivos de configuración necesarios al contenedor
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default /etc/nginx/sites-enabled/default

# Copiamos el script para configurar nginx en el contenedor
COPY ./tools/nginx_www.sh /var/www/nginx_www.sh

# Damos permisos de ejecución al script
RUN chmod +x /var/www/nginx_www.sh

# Definimos el script como el punto de entrada
ENTRYPOINT ["/var/www/nginx_www.sh"]

# CMD para iniciar nginx con la configuración adecuada
CMD ["nginx", "-g", "daemon off;"]
