#!/bin/sh

docker build --pull --force-rm --no-cache -f ./docker/nginx/Dockerfile -t $1/$2_nginx:latest ./docker/nginx
docker build --pull --force-rm --no-cache -f ./Dockerfile -t $1/$2_php:latest .