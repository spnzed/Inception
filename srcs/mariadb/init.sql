CREATE DATABASE wordpress;
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';
FLUSH PRIVILEGES;

