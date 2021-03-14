FROM php:7.2.34-fpm-alpine

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -L https://cs.symfony.com/download/php-cs-fixer-v2.phar -o php-cs-fixer \
  && chmod a+x php-cs-fixer \
  && mv php-cs-fixer /usr/local/bin/php-cs-fixer

WORKDIR /var/www/code

ARG PUID
ARG GUID
RUN apk --no-cache add shadow \
    && usermod -u $PUID www-data && groupmod -g $GUID www-data
RUN chown www-data:www-data /var/www/code
RUN mkdir -p /var/www/code/vendor && chown www-data:www-data /var/www/code/vendor
RUN mkdir -p /home/www-data/.composer && chown www-data:www-data /home/www-data/.composer

RUN apk --update add --virtual build-dependencies build-base autoconf \
  && pecl install mongodb \
  && docker-php-ext-enable mongodb \
  && pecl install pcov \
  && docker-php-ext-enable pcov \
  && apk del build-dependencies build-base autoconf

USER www-data

RUN composer global require hirak/prestissimo
