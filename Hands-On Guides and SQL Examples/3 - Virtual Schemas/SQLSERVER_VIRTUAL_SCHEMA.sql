/*

Virtual Schemas

What are virtual schemas?
Virtual schemas are an abstraction layer that makes external data sources accessible in our data analytics platform through regular SQL commands.
The contents of the external data sources are mapped to virtual tables that look like any regular Exasol tables and can be queried as such.

This concept creates a type of logical view on top of several data sources that could be databases or other data services.
Using the virtual schema, you can implement a consistent access layer for your reporting tools.
You can also use it for agile and flexible ETL processing, since there is no need to change anything in Exasol if you change or extend the objects in the underlying system.

How do I use virtual schemas?
After creating a virtual schema, you can use the virtual tables in SQL queries and combine them with persistent tables stored in Exasol, or with any other virtual table from a different virtual schema.
The SQL optimizer translates the virtual objects into connections to the underlying systems and implicitly transfers the required data.
SQL conditions are pushed to the data sources to ensure minimum data transfer and optimum performance.

The virtual schema translates the Exasol SQL into the SQL of the remote database.
Your query is rewritten into a new query that uses the IMPORT statement (https://docs.exasol.com/db/latest/sql/import.htm).
You can also load data directly using these generated statements.
To see the generated query, use the EXPLAIN VIRTUAL statement (https://docs.exasol.com/db/latest/sql/explain_virtual.htm).

Exasol provides an open and extensible framework where the connectivity logic is open sourced.
Within this framework you can choose to either use the available adapters or optimize them according to your requirements, without waiting for a new release from Exasol.


Supported Data Sources
Exasol supports many data sources for virtual schemas.
For more information and step-by-step instructions, see the Supported Dialects page on GitHub.
https://github.com/exasol/virtual-schemas/blob/main/doc/user_guide/dialects.md

*/
--
-- SQLSERVER Virtual Schema
--
-- Prerequisites:
-- The SQLSERVER or Azure SQLSERVER database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
-- WE DO NOT RECOMMEND TO USE THE OLD OUTDATED JTDS DRIVER ANYMORE.
-- IT WILL NOT WORK STABLE WITH NEWER VERSIONS OF SQLSERVER OR SQLSERVER DATABASES HOSTED IN AZURE.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File + all dependent jar files needed for authentication=ActiveDirectoryPassword in Azure
-- are already preinstalled for you in the BucketFS in this version of Exasol Community Edition.
--
-- SQLSERVER Virtual Schema Adapter Script:
-- The actual Adapter Script is already preinstalled for you
-- in the Schema VS_ADAPTERS in this version of Exasol Community Edition.
-- Documentation: https://github.com/exasol/sqlserver-virtual-schema/blob/main/doc/user_guide/sqlserver_user_guide.md
--
-- Create a connection to the SQLSERVER database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
-- See also: https://github.com/exasol/sqlserver-virtual-schema/blob/main/doc/user_guide/sqlserver_user_guide.md#defining-a-named-connection
--
-- Microsoft SQL Server Connection (On-Prem with regular authentication mechanism)
CREATE OR REPLACE CONNECTION SQLSERVER_JDBC
    TO 'jdbc:sqlserver://SQLSERVER_host_or_ip:1433;databaseName=mydemo;encrypt=true;trustServerCertificate=true;loginTimeout=30;'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM
(
IMPORT FROM JDBC AT SQLSERVER_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
-- Microsoft SQL Server Connection (hosted in Azure with regular authentication mechanism)
CREATE OR REPLACE CONNECTION AZURE_SQLSERVER_JDBC
    TO 'jdbc:sqlserver://testserver.database.windows.net:1433;databaseName=mydemo;encrypt=true;trustServerCertificate=true;loginTimeout=30;'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM
(
IMPORT FROM JDBC AT AZURE_SQLSERVER_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
-- Microsoft SQL Server Connection (hosted in Azure with authentication=ActiveDirectoryPassword)
CREATE OR REPLACE CONNECTION AZURE_SQLSERVER_ADPW_JDBC
    TO 'jdbc:sqlserver://testserver.database.windows.net:1433;databaseName=mydemo;encrypt=true;trustServerCertificate=true;loginTimeout=30;authentication=ActiveDirectoryPassword;'
    USER 'Your_ActiveDirectoryUser'
    IDENTIFIED BY 'Your_ActiveDirectoryPassword';
--
-- To test the connection, run the following statement.
--
SELECT * FROM
(
IMPORT FROM JDBC AT AZURE_SQLSERVER_ADPW_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
-- Creating your own Virtual Schema:
--
CREATE VIRTUAL SCHEMA VS_SQLSERVER_MYSCHEMA
USING VS_ADAPTERS.SQLSERVER_ADAPTER WITH
    CONNECTION_NAME = 'SQLSERVER_JDBC'
    CATALOG_NAME   = 'mysqlserverdatabase'
    SCHEMA_NAME = 'myschema'
    MAX_TABLE_COUNT = '3000';
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- a SQLSERVER Virtual Schema to a small demo SQLSERVER DB for you.
-- Simply test the Virtual Schema, make sure that your Community Edition is connected to the internet
-- and port 1433 is not blocked by your firewall.
-- You can also browse the contents of the Virtual Schema with the DbVisualizer by expanding the "Virtual Schemas".
--
SELECT * FROM "VS_SQLSERVER_EXASOLDEMO"."customers";
SELECT * FROM "VS_SQLSERVER_EXASOLDEMO"."orders";
SELECT * FROM "VS_SQLSERVER_EXASOLDEMO"."products";
--
--
