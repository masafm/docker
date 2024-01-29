ARG image
FROM ${image}
ARG image
ENV ORACLE_PASSWORD password
RUN curl -LO https://download.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm
RUN yum -y localinstall oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm
RUN /etc/init.d/oracle-xe-21c configure

