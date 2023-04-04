FROM datadog/agent:7.43.1-jmx@sha256:185e06a99d4faf68426c7e8f7d4713aa447e0b057d9452061c5c6af50f110671

ENV JMX_HOST=127.0.0.1 \
    JMX_PORT=1111 \
    DD_LOG_LEVEL=debug
COPY conf.yaml /conf.d/jmx.d/
