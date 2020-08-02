FROM php:7.4-apache

RUN apk update; \
    apk upgrade;

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

RUN service apache2 reload