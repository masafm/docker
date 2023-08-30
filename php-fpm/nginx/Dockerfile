FROM nginx:1.19-alpine
ENV DD_AGENT_HOST datadog-agent
LABEL "com.datadoghq.ad.checks"='{"nginx": {"instances": [{"nginx_status_url": "http://nginx:81/nginx_status/"}]}}'
COPY default.conf /etc/nginx/conf.d/
COPY status.conf /etc/nginx/conf.d/
