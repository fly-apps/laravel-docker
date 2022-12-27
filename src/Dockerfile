FROM ubuntu:20.04

ARG PHP_VERSION='8.2'

LABEL maintainer="Chris Fidao (fideloper@fly.io)"

ENV BUILD_PHP_VERSION=$PHP_VERSION \
    DEBIAN_FRONTEND=noninteractive \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer \
    COMPOSER_MAX_PARALLEL_HTTP=24

COPY php/ondrej_ubuntu_php.gpg /etc/apt/trusted.gpg.d/ondrej_ubuntu_php.gpg
ADD php/packages/${PHP_VERSION}.txt /tmp/php-packages.txt

RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg2 ca-certificates git-core curl \
                                                  zip unzip rsync vim-tiny htop sqlite3 \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ondrej-ubuntu-php-focal.list \
    && apt-get update \
    && apt-get -y --no-install-recommends install $(cat /tmp/php-packages.txt) \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
