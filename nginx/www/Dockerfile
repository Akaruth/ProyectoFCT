FROM php:7.0-fpm

RUN docker-php-ext-install mysqli

WORKDIR /var/www/html

COPY . /var/www/html

RUN chmod -R 777 /var/www/html
    