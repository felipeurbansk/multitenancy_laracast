FROM ubuntu:latest
FROM php:7.4-apache

RUN apt-get clean
RUN apt-get update

#install some basic tools
RUN apt-get install -y \
        git \
        tree \
        vim \
        wget \
        subversion

#install some base extensions
RUN apt-get install -y \
        zip \
        zlib1g-dev \
        libzip-dev

RUN docker-php-ext-install mysqli && a2enmod rewrite
RUN docker-php-ext-install zip

COPY ./config/000-default.conf /etc/apache2/sites-enabled/
COPY ./app/composer.json /var/www/html

RUN apt-get update

#setup composer
RUN curl -sS https://getcomposer.org/installer | php \
        && mv composer.phar /usr/local/bin/ \
        && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

#RUN composer install
