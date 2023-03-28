CREATE DATABASE wordpress;
CREATE USER wordpress IDENTIFIED BY 'wordpress';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpress;
CREATE USER 'datadog'@'%' IDENTIFIED WITH mysql_native_password by 'datadog';
 
