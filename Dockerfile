FROM ubuntu:latest
FROM php:7.4-apache

RUN apt-get update

RUN docker-php-ext-install mysqli && a2enmod rewrite

COPY ./config/000-default.conf /etc/apache2/sites-enabled/

RUN apt-get install nano