FROM debian:11

# Actualizar y agregar dependencias de NGINX y OpenSSL
RUN apt-get update && apt-get install -y \
    nginx openssl \
    && rm -rf /var/lib/apt/lists/*

# Copiar el archivo de configuración de NGINX
COPY nginx.conf /etc/nginx/nginx.conf

# Asegurarse de que el contenedor se ejecute correctamente
EXPOSE 443 80

CMD ["nginx", "-g", "daemon off;"]
