#!/bin/bash/

docker ps -a
docker images
echo -e "\033[1;31m STOPING & REMOVING DOCKER CONTAINER & IMAGE \033[0m"
docker stop $(docker ps -q)
echo -e "\033[1;31m CONTAINER STOPPED \033[0m"
docker rm -f $(docker ps -qa)
echo -e "\033[1;31m CONTAINER REMOVED \033[0m"
docker rmi $(docker images -q ft_server_image)
echo -e "\033[1;31m IMAGE REMOVED \033[0m"


#docker stop <CONTAINER ID>
#docker rm -f <CONTAINER ID>
#docker rmi <IMAGE ID>