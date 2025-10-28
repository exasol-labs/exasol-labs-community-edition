-- MYSQL_TO_EXASOL Data Migration
--
-- Prerequisites:
-- The MYSQL database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- MYSQL_TO_EXASOL Database Migration Script:
-- The actual MYSQL_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/mysql_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/mysql.htm
--
-- Create a connection to the MYSQL database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
--
CREATE OR REPLACE CONNECTION MYSQL_JDBC
    TO 'jdbc:mysql://MYSQL_host_or_ip:3306/database_name'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM
(
IMPORT FROM JDBC AT MYSQL_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
/*
     This script will generate create schema, create table and create import statements
     to load all needed data from a MYSQL database. Automatic datatype conversion is
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.MYSQL_TO_EXASOL(
   'MYSQL_JDBC',    -- name of your database connection
   true,            -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   '%',             -- schema filter --> '%' to load all schemas except 'information_schema' and 'mysql' and 'performance_schema' / '%publ%' to load all schemas like '%publ%'
   '%'              -- table filter --> '%' to load all tables / '%publ%' to load all tables like '%publ%'
);
--
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- a MYSQL connection to a small demo MYSQL DB for you.
-- Simply test the connection, make sure that your Community Edition is connected to the internet
-- and port 3306 is not blocked by your firewall.
--
--
SELECT * FROM
(
IMPORT FROM JDBC AT MYSQL_EXADEMO_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
--
EXECUTE SCRIPT DATABASE_MIGRATION.MYSQL_TO_EXASOL(
   'MYSQL_EXADEMO_JDBC',    -- name of your database connection
   true,                    -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   '%',                     -- schema filter --> '%' to load all schemas except 'information_schema' and 'mysql' and 'performance_schema' / '%publ%' to load all schemas like '%publ%'
   '%'                      -- table filter --> '%' to load all tables / '%publ%' to load all tables like '%publ%'
);
