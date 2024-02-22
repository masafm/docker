ARG image
FROM ${image}
ARG image
COPY checks.d/* /etc/datadog-agent/checks.d/
COPY conf.d/* /etc/datadog-agent/conf.d/
# Oracle client install
RUN apt update -y && apt install -y unzip libaio1 emacs vim && apt clean
RUN mkdir /opt/oracle
RUN curl -o /opt/oracle/base.zip https://download.oracle.com/otn_software/linux/instantclient/2113000/instantclient-basic-linux.x64-21.13.0.0.0dbru.zip
RUN curl -o /opt/oracle/sqlplus.zip https://download.oracle.com/otn_software/linux/instantclient/2113000/instantclient-sqlplus-linux.x64-21.13.0.0.0dbru.zip
RUN cd /opt/oracle && unzip base.zip && unzip sqlplus.zip && rm -f base.zip sqlplus.zip
RUN echo /opt/oracle/instantclient_21_13 >/etc/ld.so.conf.d/oracle-instantclient.conf
RUN ldconfig
# Microsoft Sqlserver ODBC driver install
RUN curl -o /msodbc.deb https://packages.microsoft.com/ubuntu/23.04/prod/pool/main/m/msodbcsql18/msodbcsql18_18.3.2.1-1_amd64.deb
RUN ACCEPT_EULA=Y apt install -y /msodbc.deb && rm -f /msodbc.deb
RUN cat /opt/microsoft/msodbcsql18/etc/odbcinst.ini >>$(find /opt/datadog-agent/embedded/ -name odbcinst.ini)
COPY sqlserver/odbc.ini /
RUN mv /odbc.ini $(dirname `find /opt/datadog-agent/embedded/ -name odbcinst.ini`)
