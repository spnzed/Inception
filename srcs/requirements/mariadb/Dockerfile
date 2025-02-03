# Debian image
FROM debian:11.7

# Update and upgrade to successfully install mariadb
RUN apt update -y && apt upgrade -y

# Install mariadb-server
RUN apt-get install mariadb-server -y

# Copy the .cnf file we create to the path mariadb will be
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Run the command to create the folder and permissions to the users
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

# Copy of the script that configs the users and db
COPY --chmod=755 tools/mariadb.sh /usr/local/bin/mariadb.sh

# Open the port 3306 for connectivity with WP & PHP
EXPOSE 3306

# Everytime the container is started will execute the script
ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]
