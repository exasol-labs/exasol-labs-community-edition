-- SNOWFLAKE_TO_EXASOL Data Migration
--
-- Prerequisites:
-- The SNOWFLAKE database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- SNOWFLAKE_TO_EXASOL Database Migration Script:
-- The actual SNOWFLAKE_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/snowflake_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/snowflake.htm
--
-- Create a connection to the SNOWFLAKE database:
-- To create a connection, run the following statement.
-- Replace the placeholders in the connection string and credentials with the corresponding values for your Snowflake account.
-- You can find a detailed information about configuring the Snowflake driver at the following link:
-- https://docs.snowflake.com/en/developer-guide/jdbc/jdbc-configure
--
CREATE OR REPLACE CONNECTION SNOWFLAKE_JDBC
    TO 'jdbc:snowflake://<myorganization>-<myaccount>.snowflakecomputing.com/?warehouse=<my_compute_wh>&role=<my_role>&CLIENT_SESSION_KEEP_ALIVE=true'
    USER '<sfuser>'
    IDENTIFIED BY '<sfpwd>';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT SNOWFLAKE_JDBC
STATEMENT 'select ''Connection works'' as connection_status'
);
--
/* 
     This script will generate create schema, create table and create import statements 
     to load all needed data from a SNOWFLAKE database. Automatic datatype conversion is 
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.SNOWFLAKE_TO_EXASOL(
    'SNOWFLAKE_JDBC',           -- CONNECTION_NAME:      name of the database connection inside Exasol -> e.g. SNOWFLAKE_JDBC
    true,                       -- DB2SCHEMA:            if true then Snowflake: database.schema.table => EXASOL: database.schema_table; if false then Snowflake: schema.table => EXASOL: schema.table
    '%',                        -- DB_FILTER:            filter for Snowflake db, e.g. 'master', 'ma%', 'first_db, second_db', '%'
    '%',                        -- SCHEMA_FILTER:        filter for the schemas to generate and load e.g. 'my_schema', 'my%', 'schema1, schema2', '%'
    '',                         -- EXASOL_TARGET_SCHEMA: set to empty string to use original values
    '%',                        -- TABLE_FILTER:         filter for the tables to generate and load e.g. 'my_table', 'my%', 'table1, table2', '%'
    false                       -- IDENTIFIER_CASE_INSENSITIVE: set to TRUE if identifiers should be put uppercase
);
