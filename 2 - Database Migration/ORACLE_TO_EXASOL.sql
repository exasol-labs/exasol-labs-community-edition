-- ORACLE_TO_EXASOL Data Migration
--
-- We recommend using Oracle Call Interface (OCI) with Oracle Instant Client instead of Oracle JDBC to connect to Exasol
-- because it is the fastest way to get data migrated from Oracle into Exasol.
--
-- Prerequisites:
-- The Oracle database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver and Oracle Call Interface (OCI) / Oracle Instant Client:
-- The actual JDBC Driver & settings.cfg File + Oracle Instant Client is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- ORACLE_TO_EXASOL Database Migration Script:
-- The actual ORACLE_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/oracle_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/oracle.htm
-- Oracle to Exasol Migration Guide: https://docs.exasol.com/db/latest/migration_guides/oracle/oracle_exasol.htm
--
-- Create a connection to the Oracle database:
-- To create a connection, run one of the following statements.
-- Replace the connection string and credentials as needed.
--
-- ORA (OCI) Connection (fast)
CREATE OR REPLACE CONNECTION ORACLE_OCI
    TO 'ORACLE_host_or_ip:1521/database_name'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM ORA AT ORACLE_OCI
STATEMENT 'select ''Connection works'' from dual'
);
--
--
-- JDBC Connection (slower than ORA Connection)
CREATE OR REPLACE CONNECTION ORACLE_JDBC
    TO 'jdbc:oracle:thin:@//ORACLE_host_or_ip:1521/database_name'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT ORACLE_JDBC
STATEMENT 'select ''Connection works'' from dual'
);
--
/* 
    This script will generate create schema, create table and create import statements 
    to load all needed data from an Oracle database. Automatic datatype conversion is 
    applied whenever needed. Primary and foreign key constraints will be generated
    but can be commented out via script parameters. This script can also create and populate
    check tables to identify differences. A summary table for all the check tables allows for easy queriying.
    Copy out the generated statements and execute them in a separate SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.ORACLE_TO_EXASOL(
   'ORACLE_OCI',        -- connection name
   true,                -- case insensitivity flag
   '%DEMO%',            -- schema name filter
   '%',                 -- table name filter
   4,                   -- degree of parallelism for the import statements
   false,               -- flag for primary key generation
   false,               -- flag for foreign key generation
   false                -- flag for creation and loading of checking tables
)
;
--
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- an ORA connection to a small demo Oracle DB for you.
-- Simply test the connection, make sure that your Community Edition is connected to the internet
-- and port 1521 is not blocked by your firewall.
--
--
SELECT * FROM 
(
IMPORT FROM ORA AT ORACLE_EXADEMO_OCI
STATEMENT 'select ''Connection works'' from dual'
);
--
--
EXECUTE SCRIPT DATABASE_MIGRATION.ORACLE_TO_EXASOL(
   'ORACLE_EXADEMO_OCI', -- connection name
   true,                 -- case insensitivity flag
   'EXASOLDEMO',         -- schema name filter
   '%',                  -- table name filter
   4,                    -- degree of parallelism for the import statements
   false,                -- flag for primary key generation
   false,                -- flag for foreign key generation
   false                 -- flag for creation and loading of checking tables
)
;
