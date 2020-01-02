#!/bin/sh

docker push $1/$2_nginx:latest
docker push $1/$2_php:latest