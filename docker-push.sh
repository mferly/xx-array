#!/bin/sh

if [[ "$TRAVIS_BRANCH" == "master" ]]; then
    docker push $1/$2_nginx:latest
    docker push $1/$2_php:latest
fi