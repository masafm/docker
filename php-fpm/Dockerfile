FROM php:8.1.12-fpm-bullseye
RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all --enable-profiling
RUN mkdir -p /usr/share/nginx/html/
COPY index.php /usr/share/nginx/html/
