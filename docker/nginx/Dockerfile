FROM nginx:latest

RUN apt-get update && apt-get upgrade -y \
        ca-certificates \
        netcat-openbsd \
    && apt-get autoremove -y \
    && rm /etc/nginx/conf.d/default.conf

ENV APP_NAME=xx-array
ENV APP_PATH=/var/www/xx-array

COPY certs/${APP_NAME}-cert.pem /etc/ssl/certs/${APP_NAME}-cert.pem
COPY certs/${APP_NAME}-key.pem /etc/ssl/private/${APP_NAME}-key.pem
COPY certs/dhparam.pem /etc/nginx/dhparam.pem
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/${APP_NAME}.conf /etc/nginx/conf.d/${APP_NAME}.conf
COPY conf/self-signed.conf /etc/nginx/conf.d/self-signed.conf
COPY conf/ssl-params.conf /etc/nginx/conf.d/ssl-params.conf

RUN update-ca-certificates