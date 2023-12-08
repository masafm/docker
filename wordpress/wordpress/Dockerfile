FROM wordpress:4.8-apache
COPY status.conf /etc/apache2/mods-available/status.conf
#COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY htaccess /htaccess
# cp /htaccess /var/www/html/.htaccess

LABEL "com.datadoghq.ad.check_names"='["mysql"]'
LABEL "com.datadoghq.ad.init_configs"='[{}]'
LABEL "com.datadoghq.ad.instances"='[{"dbm": true, "host": "masafumi-kashiwagi-aurora-mysql-instance-1.c3bw7kcbozbg.ap-northeast-1.rds.amazonaws.com", "port": 3306,"username": "datadog","password": "datadog"},{"dbm": true, "host": "masafumi-kashiwagi-aurora-mysql-instance-1-ap-northeast-1a.c3bw7kcbozbg.ap-northeast-1.rds.amazonaws.com", "port": 3306,"username": "datadog","password": "datadog"}]'
