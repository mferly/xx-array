#!/bin/sh

docker build --pull --force-rm --no-cache -f ./Dockerfile-nginx -t xx-array_nginx:latest .
docker build --pull --force-rm --no-cache -f ./Dockerfile-php -t xx-array_php:latest .