# srcs/requirements/nginx/Dockerfile
FROM debian:bullseye

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

# COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# srcs/requirements/nginx/conf/nginx.conf
# server {
#     listen 443 ssl;
#     listen [::]:443 ssl;
    
#     server_name aaespino.42.fr;
    
#     ssl_certificate /etc/nginx/ssl/nginx.crt;
#     ssl_certificate_key /etc/nginx/ssl/nginx.key;
#     ssl_protocols TLSv1.2 TLSv1.3;
    
#     root /var/www/html;
#     index index.php;
    
#     location / {
#         try_files $uri $uri/ /index.php?$args;
#     }
    
#     location ~ \.php$ {
#         fastcgi_split_path_info ^(.+\.php)(/.+)$;
#         fastcgi_pass wordpress:9000;
#         fastcgi_index index.php;
#         include fastcgi_params;
#         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#         fastcgi_param PATH_INFO $fastcgi_path_info;
#     }
# }