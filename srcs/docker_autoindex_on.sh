#!/bin/bash
NGINX_CONF=/etc/nginx/sites-enabled/nginx.conf
sed -i "s/autoindex off;/autoindex on;/g" $NGINX_CONF

service nginx restart
echo -e "\033[1;32m autoindex on \033[0m"