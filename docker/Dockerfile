FROM php:7.4.3-fpm-alpine

RUN apk --update add --virtual build-dependencies build-base autoconf \
  && pecl install mongodb \
  && docker-php-ext-enable mongodb \
  && apk del build-dependencies build-base autoconf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/code

ARG PUID
ARG GUID
RUN apk --no-cache add shadow && \
    usermod -u $PUID www-data && groupmod -g $GUID www-data
RUN mkdir -p /var/www/code/vendor && chown www-data:www-data /var/www/code/vendor
RUN mkdir -p /home/www-data/.composer && chown www-data:www-data /home/www-data/.composer

USER www-data
