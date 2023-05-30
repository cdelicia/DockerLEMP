#deploy a basic LEMP project (web application)

FROM debian:buster

LABEL maintainer="cdelicia <cdelicia@student.21-school.ru.>"

RUN apt-get update
RUN apt-get install -y nginx mariadb-server php-mysql php-fpm vim openssl

ADD ./srcs/wordpress.tar /var/www/html/
ADD	./srcs/phpmyadmin.tar /var/www/html/

COPY ./srcs/start.sh /etc
COPY ./srcs/nginx.conf /etc/nginx/sites-enabled
COPY ./srcs/wp-config.php /var/www/html/wordpress
COPY ./srcs/init_sql.sql /etc
COPY ./srcs/config.inc.php /var/www/html/phpMyAdmin-4.9.5-all-languages
COPY ./srcs/docker_autoindex_on.sh /etc
COPY ./srcs/docker_autoindex_off.sh /etc

RUN mv /var/www/html/phpMyAdmin-4.9.5-all-languages /var/www/html/phpmyadmin && \
	chown -R www-data /var/www/html && rm /etc/nginx/sites-enabled/default

RUN mkdir /etc/ssl/key && mkdir /etc/ssl/cert && \
	openssl req -x509 -newkey rsa:2048 -nodes -days 365 -keyout /etc/ssl/key/localhost.key \
	-out /etc/ssl/cert/localhost.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21SCHOOL/CN=localhost"

RUN service mysql start && mysql -u root < /etc/init_sql.sql

EXPOSE 80 443

ENTRYPOINT bash /etc/start.sh
