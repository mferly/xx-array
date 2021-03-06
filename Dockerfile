FROM php:7.4.1-fpm-alpine3.11

RUN apk add --update --no-cache $PHPIZE_DEPS \
        bash \
        zip \
        unzip \
        yarn \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable opcache \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

ENV APP_PATH=/var/www/xx-array

COPY . ${APP_PATH}
RUN sh ${APP_PATH}/bin/build.sh prod 0 production