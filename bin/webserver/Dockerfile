# Useful for Hetzner Dev
FROM php:8.1.17-apache-buster

ENV PHP_VERSION=8.1

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
RUN pecl install xdebug-3.2.0
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
    soap \
    mysqli


# Install YAML extension useful by Symfony and need by composer inside docker
RUN  pecl install yaml && echo "extension=yaml.so" > /usr/local/etc/php/conf.d/ext-yaml.ini && docker-php-ext-enable yaml

# unicode symbols activation
RUN apt-get -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

# Insatall ioncube loader
# Install the ioncube loader - set the PHP_VERSION to what you need
RUN mkdir -p /usr/local/lib && curl -sSlL  -o /tmp/ioncube.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz && tar -x --strip-components=1 -C /usr/local/lib -f /tmp/ioncube.tar.gz ioncube/ioncube_loader_lin_${PHP_VERSION}.so

# a2enmod: enable apache modules and start it rewrite, headers, ssl
RUN a2enmod rewrite headers
