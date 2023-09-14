ARG image="nginx:1.19.0-alpine"
FROM ${image}
ARG image="nginx:1.19.0-alpine" #need to specify again after FROM
ENV DD_AGENT_HOST dd-agent
LABEL "com.datadoghq.ad.checks"='{"nginx": {"instances": [{"nginx_status_url": "http://nginx:81/nginx_status/"}]}}'
COPY default.conf /etc/nginx/conf.d/
COPY status.conf /etc/nginx/conf.d/
COPY install-dd-module.sh /
RUN apk --no-cache add jq wget tar curl
RUN /install-dd-module.sh "${image}"
RUN sed -i "1i load_module modules/ngx_http_datadog_module.so;" /etc/nginx/nginx.conf
