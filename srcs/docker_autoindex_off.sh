#!/bin/bash
NGINX_CONF=/etc/nginx/sites-enabled/nginx.conf
sed -i "s/autoindex on;/autoindex off;/g" $NGINX_CONF

service nginx restart
echo -e "\033[1;31m autoindex off \033[0m"