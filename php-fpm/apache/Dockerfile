ARG image="httpd:2.4.57-alpine"
FROM ${image}
ARG image="httpd:2.4.57-alpine" #need to specify again after FROM
ENV DD_AGENT_HOST dd-agent
#LABEL "com.datadoghq.ad.checks"='{"nginx": {"instances": [{"nginx_status_url": "http://nginx:81/nginx_status/"}]}}'
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
