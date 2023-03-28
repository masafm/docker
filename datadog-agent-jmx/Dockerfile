FROM datadog/agent:7.16.0-jmx

ENV JMX_HOST=127.0.0.1 \
    JMX_PORT=1099

COPY conf.yaml /conf.d/jmx.d/
