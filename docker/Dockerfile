FROM php:7.4.3-fpm-alpine

RUN apk --update add --virtual build-dependencies build-base autoconf \
  && pecl install mongodb \
  && docker-php-ext-enable mongodb \
  && apk del build-dependencies build-base autoconf
