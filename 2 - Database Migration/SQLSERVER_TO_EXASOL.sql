-- SQLSERVER_TO_EXASOL Data Migration
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
-- SQLSERVER_TO_EXASOL Database Migration Script:
-- The actual SQLSERVER_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/sqlserver_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/sql_server.htm
--
-- Create a connection to the SQLSERVER database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
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
/*
     This script will generate create schema, create table and create import statements
     to load all needed data from a SQLSERVER or Azure SQLSERVER database. Automatic datatype conversion is
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.SQLSERVER_TO_EXASOL(
    'SQLSERVER_JDBC', -- CONNECTION_NAME:             name of the database connection inside exasol -> e.g. sqlserver_db
    false,            -- DB2SCHEMA:                   if true then SQL Server: database.schema.table => EXASOL: database.schema_table; if false then SQLSERVER: schema.table => EXASOL: schema.table
    'mydemo',         -- DB_FILTER:                   filter for SQLSERVER db, e.g. 'master', 'ma%', 'first_db, second_db', '%'
    'SalesLT',        -- SCHEMA_FILTER:               filter for the schemas to generate and load e.g. 'my_schema', 'my%', 'schema1, schema2', '%'
    'SALESLT',        -- EXASOL_TARGET_SCHEMA:        set to empty string to use original values
    '%',              -- TABLE_FILTER:                filter for the tables to generate and load e.g. 'my_table', 'my%', 'table1, table2', '%'
    true              -- IDENTIFIER_CASE_INSENSITIVE: set to TRUE if identifiers should be put uppercase
);
--
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- a SQLSERVER connection to a small demo SQLSERVER DB for you.
-- Simply test the connection, make sure that your Community Edition is connected to the internet
-- and port 1433 is not blocked by your firewall.
--
--
SELECT * FROM
(
IMPORT FROM JDBC AT SQLSERVER_EXADEMO_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
--
execute script database_migration.SQLSERVER_TO_EXASOL(
    'SQLSERVER_EXADEMO_JDBC', -- CONNECTION_NAME:             name of the database connection inside exasol -> e.g. sqlserver_db
    false,                    -- DB2SCHEMA:                   if true then SQL Server: database.schema.table => EXASOL: database.schema_table; if false then SQLSERVER: schema.table => EXASOL: schema.table
    'exademo',                -- DB_FILTER:                   filter for SQLSERVER db, e.g. 'master', 'ma%', 'first_db, second_db', '%'
    'exasoldemo',             -- SCHEMA_FILTER:               filter for the schemas to generate and load e.g. 'my_schema', 'my%', 'schema1, schema2', '%'
    'EXASOLDEMO',             -- EXASOL_TARGET_SCHEMA:        set to empty string to use original values
    '%',                      -- TABLE_FILTER:                filter for the tables to generate and load e.g. 'my_table', 'my%', 'table1, table2', '%'
    true                      -- IDENTIFIER_CASE_INSENSITIVE: set to TRUE if identifiers should be put uppercase
);
