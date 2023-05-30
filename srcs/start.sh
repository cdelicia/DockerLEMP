#!/bin/bash/
#To start the Nginx service on a Linux machine, and php-fpm

service nginx start &&
service php7.3-fpm start &&
service mysql start

while true;
do
	sleep 1000;
done