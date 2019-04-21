FROM php:7.3.3-apache

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# Install useful tools
RUN apt-get -y install apt-utils nano wget dialog


# Install important libraries
RUN apt-get -y install --fix-missing apt-utils build-essential git curl libcurl3 libcurl3-dev zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install xdebug
RUN pecl install xdebug-2.7.0
RUN docker-php-ext-enable xdebug

# Other PHP7 Extensions
RUN apt-get -y install libmcrypt-dev

RUN pecl install mcrypt-1.0.2
RUN docker-php-ext-enable mcrypt

RUN rm /etc/apt/preferences.d/no-debian-php
# Download packages
RUN apt-get -y install \
    libsqlite3-dev \
    libsqlite3-0 \
    mysql-client \
    libxml2-dev \
    zlib1g-dev \
    zlib1g-dev \
    libzip-dev \
    php-soap \
    libyaml-dev

RUN docker-php-ext-install \
    pdo_mysql \
    pdo_sqlite \
    mysqli \
    curl \
    tokenizer \
    json \
    soap \
    zip

# Install YAML extension
RUN pecl install yaml-2.0.4 && echo "extension=yaml.so" > /usr/local/etc/php/conf.d/ext-yaml.ini

# unicode symbols activation
RUN apt-get -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

# multibyte encodings in PHP.
RUN docker-php-ext-install mbstring

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# todo add ssl cert creation

# a2enmod: enable apache modules and start it rewrite, headers, ssl
RUN a2enmod rewrite headers ssl

# download and install xt:Commerce to system

# ARG XTC_DOWNLOAD_URL="https://s3-eu-west-1.amazonaws.com/xtc6/xtCommerce_6.1.1-2019-03-27.zip"
# RUN curl http://example.org/file.zip | tar -xf - -C path/to/save
