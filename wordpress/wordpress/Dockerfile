ARG image
FROM ${image}
ARG image
RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all --enable-appsec --enable-profiling
RUN touch /usr/src/wordpress/server-status
COPY status.conf /etc/apache2/mods-available/status.conf
