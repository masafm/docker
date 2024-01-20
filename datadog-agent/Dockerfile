ARG image
FROM ${image}
ARG image
COPY checks.d/* /etc/datadog-agent/checks.d/
COPY conf.d/* /etc/datadog-agent/conf.d/
# LABEL "com.datadoghq.ad.check_names"='["mysql","mysql"]'
# LABEL "com.datadoghq.ad.init_configs"='[{},{}]'
# LABEL "com.datadoghq.ad.instances"='[{"dbm": true, "host": "masafumi-kashiwagi-aurora-mysql-instance-1.c3bw7kcbozbg.ap-northeast-1.rds.amazonaws.com", "port": 3306,"username": "datadog","password": "datadog"},{"dbm": true, "host": "masafumi-kashiwagi-aurora-mysql-instance-1-ap-northeast-1a.c3bw7kcbozbg.ap-northeast-1.rds.amazonaws.com", "port": 3306,"username": "datadog","password": "datadog"}]'
