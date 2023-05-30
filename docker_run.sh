#!/bin/bash/

docker build -t ft_server_image .
docker run -d --name ft_server -p 80:80 -p 443:443 ft_server_image
docker exec -it ft_server bash