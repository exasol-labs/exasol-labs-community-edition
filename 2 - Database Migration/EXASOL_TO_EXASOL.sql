-- EXASOL_TO_EXASOL Data Migration
--
-- You can load data from another Exasol database using the native EXA or JDBC interfaces.
-- Using the native EXA interface is faster than the JDBC interface.
--
-- Prerequisites:
-- The other Exasol database must be reachable from this Exasol database.
-- The port range from 20000 to 21000 must be opened in the other database if you want to use the native EXA interface.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- There is no need to install an Exasol JDBC driver. It is automatically integrated in the product.
--
-- EXASOL_TO_EXASOL Database Migration Script:
-- The actual EXASOL_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/exasol_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/exasol.htm
--
-- Create a connection to the other Exasol database:
-- To create a connection, run one of the following statements.
-- Replace the connection string and credentials as needed.
-- If you use self-signed cerificates in your other Exasol database, make sure you add either the fingerprint
-- or the keyword nocertcheck in your connection string.
-- Additionally always make sure you add all your database nodes to the connection string.
-- See also: https://docs.exasol.com/db/latest/connect_exasol/drivers/jdbc.htm
--
-- EXA Connection (fast)
CREATE OR REPLACE CONNECTION EXASOL_EXA
    TO '192.168.6.11..14/nocertcheck:8563'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM EXA AT EXASOL_EXA
STATEMENT 'SELECT ''Connection works'' '
);
--
--
-- EXA Connection to an Exasol SaaS database (fast)
CREATE OR REPLACE CONNECTION EXASOL_SAAS_EXA
    TO 'my_database_id.clusters.exasol.com:8563'
    USER 'my_user_name'
    IDENTIFIED BY 'my_personal_access_token';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM EXA AT EXASOL_SAAS_EXA
STATEMENT 'SELECT ''Connection works'' '
);
--
--
-- JDBC Connection (slower than EXA Connection)
CREATE OR REPLACE CONNECTION EXASOL_JDBC
    TO 'jdbc:exa:192.168.6.11..14/nocertcheck:8563'
    USER 'user'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT EXASOL_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
--
-- JDBC Connection to an Exasol SaaS database (slower than EXA Connection)
CREATE OR REPLACE CONNECTION EXASOL_SAAS_JDBC
    TO 'jdbc:exa:my_database_id.clusters.exasol.com:8563'
    USER 'my_user_name'
    IDENTIFIED BY 'my_personal_access_token';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT EXASOL_SAAS_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
/* 
    This script will generate create schema, create table and create import statements 
    to load all needed data from an EXASOL database. Automatic datatype conversion is 
    applied whenever needed. Copy out the generated statements and execute them in a separate
    SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.EXASOL_TO_EXASOL(
   'EXASOL_EXA'       -- name of your database connection   
   ,'EXA'             -- set if import from EXA or JDBC connection
   ,FALSE             -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive
   ,'%TPC%'           -- schema filter --> '%' to load all schemas except 'SYS' and 'EXA_STATISTICS'/ '%pub%' to load all schemas like '%pub%'
   ,'%'               -- table filter --> '%' to load all tables
   ,'TRUE'            -- view inclusion flag --> 'TRUE' to include views
   ,'%'               -- view filter --> '%' to generate all views
   ,'DISABLE'         -- pk & fk setting --> disable/enable to create disabled/enabled primary key
);
--
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- an EXA connection to our Exasol Public Demo Database for you (https://www.exasol.com/cloud-testing/).
-- Simply test the connection, make sure that your Community Edition is connected to the internet
-- and port 8563 is not blocked by your firewall.
--
--
SELECT * FROM 
(
IMPORT FROM EXA AT EXASOL_DEMODB_EXA
STATEMENT 'SELECT ''Connection works'' '
);
--
--
EXECUTE SCRIPT DATABASE_MIGRATION.EXASOL_TO_EXASOL(
   'EXASOL_DEMODB_EXA' -- name of your database connection   
   ,'EXA'              -- set if import from EXA or JDBC connection
   ,FALSE              -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive
   ,'TPCDS_10GB'        -- schema filter --> '%' to load all schemas except 'SYS' and 'EXA_STATISTICS'/ '%pub%' to load all schemas like '%pub%'
   ,'%'                -- table filter --> '%' to load all tables
   ,'TRUE'             -- view inclusion flag --> 'TRUE' to include views
   ,'%'                -- view filter --> '%' to generate all views
   ,'DISABLE'          -- pk & fk setting --> disable/enable to create disabled/enabled primary key
);