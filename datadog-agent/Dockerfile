ARG image
FROM ${image}
ARG image
COPY checks.d/* /etc/datadog-agent/checks.d/
COPY conf.d/* /etc/datadog-agent/conf.d/
# Oracle client install
RUN apt update -y && apt install -y unzip libaio1 && apt clean
RUN mkdir /opt/oracle
RUN curl -o /opt/oracle/base.zip https://download.oracle.com/otn_software/linux/instantclient/2113000/instantclient-basic-linux.x64-21.13.0.0.0dbru.zip
RUN curl -o /opt/oracle/sqlplus.zip https://download.oracle.com/otn_software/linux/instantclient/2113000/instantclient-sqlplus-linux.x64-21.13.0.0.0dbru.zip
RUN cd /opt/oracle && unzip base.zip && unzip sqlplus.zip && rm -f base.zip sqlplus.zip
RUN echo /opt/oracle/instantclient_21_13 >/etc/ld.so.conf.d/oracle-instantclient.conf
RUN ldconfig
