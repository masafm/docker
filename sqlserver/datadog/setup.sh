#!/bin/bash
sleep 10
/opt/mssql-tools/bin/sqlcmd -S sqlserver -U SA -P "${MSSQL_SA_PASSWORD}" -i /datadog/datadog.sql
