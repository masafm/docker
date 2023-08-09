FROM mysql:latest
ENV MYSQL_ALLOW_EMPTY_PASSWORD 1
ENV DD_AGENT_HOST datadog-agent
COPY default.sql /docker-entrypoint-initdb.d/
CMD ["mysqld"]

