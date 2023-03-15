FROM mysql:latest
ENV MYSQL_ALLOW_EMPTY_PASSWORD 1
ENV DD_AGENT_HOST datadog-agent
COPY wordpress.sql .
CMD ["mysqld"]

