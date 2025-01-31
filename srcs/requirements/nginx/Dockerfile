FROM debian:bullseye

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Crear certificado SSL autofirmado
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42/CN=aaespino.42.fr"

# Copiar configuración de nginx desde tu directorio
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

# Comando para iniciar nginx
CMD ["nginx", "-g", "daemon off;"]
