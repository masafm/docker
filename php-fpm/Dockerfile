ARG image
FROM ${image}
ARG image
RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all --enable-profiling --enable-appsec
RUN mkdir -p /usr/share/nginx/html/
RUN mkdir -p /var/log/php-fpm/
#RUN sed -i "$ a env[DD_PROFILING_ENABLED]=0" /usr/local/etc/php-fpm.d/www.conf
#RUN sed -i 's/extension = datadog-profiling.so/;extension = datadog-profiling.so/g' /usr/local/etc/php/conf.d/98-ddtrace.ini
COPY src/*.php /usr/share/nginx/html/
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
CMD ["/bin/sh", "-c", "php-fpm 2>&1"]
