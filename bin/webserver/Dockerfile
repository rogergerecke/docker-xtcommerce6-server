# Useful for Hetzner Dev
FROM php:8.1.17-apache-buster

# Fix Debian with noninteractive we run a automatic install and no Interactive
ARG DEBIAN_FRONTEND=noninteractive

# Install useful tools: apt-utils nano wget dialog need update befor cant install
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y
RUN apt-get -y install apt-utils nano wget dialog

# GD Libary install
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# PECL Xdebug Extention Install https://pecl.php.net/
RUN pecl install xdebug-2.9.2
RUN docker-php-ext-enable xdebug

# Fix Debian: has no installation candidate
RUN rm /etc/apt/preferences.d/no-debian-php

# Download packages
RUN apt-get -y install \
    libxml2-dev \
    zlib1g-dev \
    zlib1g-dev \
    libzip-dev \
    php-soap \
    libyaml-dev \
    unzip

# Install packages
RUN docker-php-ext-install \
    pdo_mysql \
    tokenizer \
    json \
    soap \
    zip


# Install YAML extension useful by Symfony and need by composer inside docker
RUN pecl install install yaml

# unicode symbols activation
RUN apt-get -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl


# a2enmod: enable apache modules and start it rewrite, headers, ssl
RUN a2enmod rewrite headers
