CREATE DATABASE mysql_database;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON mysql_database.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;