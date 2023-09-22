ARG image="php:8.1.12-fpm-bullseye"
FROM ${image}
ARG image="php:8.1.12-fpm-bullseye" #need to specify again after FROM
#ENV DD_AGENT_HOST dd-agent
ENV DD_ENV dev
ENV DD_SERVICE my-php-fpm
ENV DD_VERSION 1.0
RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all --enable-profiling --enable-appsec
RUN mkdir -p /usr/share/nginx/html/
COPY src/*.php /usr/share/nginx/html/
