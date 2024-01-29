ARG image
FROM container-registry.oracle.com/database/instantclient AS oracle
FROM ${image}
ARG image
COPY checks.d/* /etc/datadog-agent/checks.d/
COPY conf.d/* /etc/datadog-agent/conf.d/
COPY --from=oracle /usr/lib/oracle/12.2/client64/lib/ojdbc8.jar /opt/ojdbc.jar
# LABEL "com.datadoghq.ad.check_names"='["mysql","mysql"]'
# LABEL "com.datadoghq.ad.init_configs"='[{},{}]'
# LABEL "com.datadoghq.ad.instances"='[{"dbm": true, "host": "masafumi-kashiwagi-aurora-mysql-instance-1.c3bw7kcbozbg.ap-northeast-1.rds.amazonaws.com", "port": 3306,"username": "datadog","password": "datadog"},{"dbm": true, "host": "masafumi-kashiwagi-aurora-mysql-instance-1-ap-northeast-1a.c3bw7kcbozbg.ap-northeast-1.rds.amazonaws.com", "port": 3306,"username": "datadog","password": "datadog"}]'
