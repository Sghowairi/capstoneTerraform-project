#!/bin/bash 

sudo apt-get update -yy
sudo apt-get install -yy git curl 

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
mkdir -p /my/custom
docker run -d -p 3306:3306 --name mysql -v /my/custom:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=shahad123 mysql 