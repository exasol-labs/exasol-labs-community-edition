-- POSTGRESQL_TO_EXASOL Data Migration
--
-- Prerequisites:
-- The POSTGRESQL database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- POSTGRESQL_TO_EXASOL Database Migration Script:
-- The actual POSTGRESQL_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/postgres_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/postgresql.htm
--
-- Create a connection to the POSTGRESQL database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
--
CREATE OR REPLACE CONNECTION POSTGRESQL_JDBC
    TO 'jdbc:postgresql://POSTGRESQL_host_or_ip:5432/database_name'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM
(
IMPORT FROM JDBC AT POSTGRESQL_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
/*
     This script will generate create schema, create table and create import statements
     to load all needed data from a POSTGRESQL database. Automatic datatype conversion is
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.POSTGRESQL_TO_EXASOL(
   'POSTGRESQL_JDBC',  -- name of your database connection
   true,               -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   '%',                -- schema filter --> '%' to load all schemas except 'information_schema' and 'pg_catalog' / '%publ%' to load all schemas like '%publ%'
   '%',                -- table filter --> '%' to load all tables
   'MY_SCHEMA'         -- destination schema in the Exasol database
);
--
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- a POSTGRESQL connection to a small demo POSTGRESQL DB for you.
-- Simply test the connection, make sure that your Community Edition is connected to the internet
-- and port 5432 is not blocked by your firewall.
--
--
SELECT * FROM
(
IMPORT FROM JDBC AT POSTGRESQL_EXADEMO_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
--
EXECUTE SCRIPT DATABASE_MIGRATION.POSTGRESQL_TO_EXASOL(
   'POSTGRESQL_EXADEMO_JDBC',  -- name of your database connection
   true,                       -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   '%',                        -- schema filter --> '%' to load all schemas except 'information_schema' and 'pg_catalog' / '%publ%' to load all schemas like '%publ%'
   '%',                        -- table filter --> '%' to load all tables
   'EXASOLDEMO'                -- destination schema in the Exasol database
);
