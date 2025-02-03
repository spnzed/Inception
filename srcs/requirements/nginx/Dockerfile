# Use Debian base image
FROM debian:11.7

# Update and upgrade in order to install nginx
RUN apt upgrade -y && apt update -y

# Install nginx
RUN apt install -y nginx

# Access the container terminal
RUN apt install vim -y
RUN apt install curl -y

# TSL
# Create a folder to store the certificate
RUN mkdir -p /etc/nginx/ssl
#Install OpenSSl. Tool for SSL certificate management/creation.
RUN apt install openssl
# Create SSL certificate with OpenSSL and pre-fill the -keyout option
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=ES/ST=CAT/L=Barcelona/O=42/OU=42/CN=$aaespino.42.fr/UID=$aaespino"

# Create folder to store NGINX config
RUN mkdir -p /run/nginx
# Take base NGINX conf file and modify with our ./conf/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

#Ensure that we'll have te rights of the web root directory
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Open port 443 for connection
EXPOSE 443

# Launch NGINX
ENTRYPOINT ["nginx", "-g", "daemon off;"]
