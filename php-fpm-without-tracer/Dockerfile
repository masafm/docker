FROM php:8.0.11-fpm-bullseye

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
    && docker-php-ext-enable \
        apcu \
        igbinary \
        redis

RUN mkdir -p /usr/share/nginx/html/
COPY index.php /usr/share/nginx/html/
