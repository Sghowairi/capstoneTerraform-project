#!/bin/bash 

sudo apt-get update -yy
sudo apt-get install -yy git curl 

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

docker volume create DB
docker run -d -p 3306:3306 --name db -v DB:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=password  -e MYSQL_USER=user -e MYSQL_HOST=db -e MYSQL_PASSWORD=password -e MYSQL_DATABASE=mydatabase mysql 