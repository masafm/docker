CREATE LOGIN datadog WITH PASSWORD = 'Datad0gs';
CREATE USER datadog FOR LOGIN datadog;
GRANT CONNECT ANY DATABASE to datadog;
GRANT VIEW SERVER STATE to datadog;
GRANT VIEW ANY DEFINITION to datadog;
-- To use Log Shipping Monitoring (available in Agent v7.50+), uncomment the next three lines:
USE msdb;
CREATE USER datadog FOR LOGIN datadog;
GRANT SELECT to datadog;
