-- DB2_TO_EXASOL Data Migration
--
-- Prerequisites:
-- The DB2 database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- DB2_TO_EXASOL Database Migration Script:
-- The actual DB2_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/db2_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/db2.htm
--
-- Create a connection to the DB2 database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
--
CREATE OR REPLACE CONNECTION DB2_JDBC
    TO 'jdbc:db2://DB2_host_or_ip:50000/database_name'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT DB2_JDBC
STATEMENT 'SELECT ''Connection works'' FROM SYSIBM.SYSDUMMY1'
);
--
/* 
     This script will generate create schema, create table and create import statements 
     to load all needed data from a DB2 database. Automatic datatype conversion is 
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.DB2_TO_EXASOL(
   'DB2_JDBC',      -- name of your database connection
   true,            -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   '%DEMO%',        -- schema filter --> '%' to load all schemas except 'SYSCAT','SYSIBM', 'SYSIBMADM', 'SYSPUBLIC', 'SYSSTAT', 'SYSTOOLS' / '%publ%' to load all schemas like '%publ%'
   '%'              -- table filter --> '%' to load all tables
);
--
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- a DB2 connection to a small demo DB2 for you.
-- Simply test the connection, make sure that your Community Edition is connected to the internet
-- and port 50000 is not blocked by your firewall.
--
--
SELECT * FROM 
(
IMPORT FROM JDBC AT DB2_EXADEMO_JDBC
STATEMENT 'SELECT ''Connection works'' FROM SYSIBM.SYSDUMMY1'
);
--
--
EXECUTE SCRIPT DATABASE_MIGRATION.DB2_TO_EXASOL(
   'DB2_EXADEMO_JDBC',     -- name of your database connection
   true,                   -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   'EXASOLDEMO',           -- schema filter --> '%' to load all schemas except 'SYSCAT','SYSIBM', 'SYSIBMADM', 'SYSPUBLIC', 'SYSSTAT', 'SYSTOOLS' / '%publ%' to load all schemas like '%publ%'
   '%'                     -- table filter --> '%' to load all tables
);
