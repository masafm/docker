ARG image
FROM ${image}
ARG image
ENV PHP_FPM_ADDR localhost:9000
#COPY default.conf /etc/nginx/conf.d/
COPY default.conf.template /etc/nginx/templates/
COPY status.conf /etc/nginx/conf.d/
COPY install-dd-module.sh /
RUN apk --no-cache add jq wget tar curl
RUN /install-dd-module.sh "${image}"
RUN sed -i "1i load_module modules/ngx_http_datadog_module.so;" /etc/nginx/nginx.conf
