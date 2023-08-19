FROM php:8.0.11-fpm-bullseye

ARG NR_VERSION=9.17.1.301

RUN apt-get update && apt-get install -y \
    libfcgi0ldbl \
    libpng-dev \
    git \
    ssh \
    procps \
    msmtp \
    pigz \
    libbz2-dev \
    libjpeg-dev \
    libfaketime \
    libgmp-dev \
    libgmp3-dev \
    libzip-dev \
    libicu-dev \
    tini \
    && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        bz2 \
        exif \
        gd \
        gmp \
        intl \
        mysqli \
        opcache \
        pcntl \
        pdo_mysql \
        sockets \
        zip \
    && pecl install \
        apcu \
        igbinary \
        redis-5.3.3 \
        xdebug-3.0.4 \
	pecl_http \
    && docker-php-ext-enable \
        apcu \
        igbinary \
        redis

RUN curl -L https://download.newrelic.com/php_agent/archive/${NR_VERSION}/newrelic-php5-${NR_VERSION}-linux.tar.gz | tar -C /tmp -zx \
    && export NR_INSTALL_USE_CP_NOT_LN=1 \
    && export NR_INSTALL_SILENT=1 \
    && /tmp/newrelic-php5-*/newrelic-install install \
    && rm -rf /tmp/newrelic-php5-* /tmp/nrinstall* \
    && rm -f /usr/bin/newrelic-daemon \
    && rm -f /etc/default/newrelic-daemon \
    && rm -f /etc/init.d/newrelic-daemon \
    && rm -f /usr/local/etc/php/conf.d/newrelic.ini

RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all
RUN mkdir -p /usr/share/nginx/html/
COPY index.php /usr/share/nginx/html/
