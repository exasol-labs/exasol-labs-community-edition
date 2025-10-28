-- REDSHIFT_TO_EXASOL Data Migration
--
-- Prerequisites:
-- Amazon Redshift must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- REDSHIFT_TO_EXASOL Database Migration Script:
-- The actual REDSHIFT_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/redshift_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/amazon_redshift.htm
--
-- Create a connection to the REDSHIFT database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
-- The JDBC URL has the following format: jdbc:redshift://endpoint:port/database
-- See also https://docs.aws.amazon.com/redshift/latest/mgmt/jdbc20-obtain-url.html for more information.
--
CREATE OR REPLACE CONNECTION REDSHIFT_JDBC
    TO 'jdbc:redshift://examplecluster.abc123xyz789.us-west-2.redshift.amazonaws.com:5439/dev'
    USER 'awsuser'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT REDSHIFT_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
/* 
     This script will generate create schema, create table and create import statements 
     to load all needed data from a REDSHIFT database. Automatic datatype conversion is 
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.REDSHIFT_TO_EXASOL(
   'REDSHIFT_JDBC', -- name of your database connection
   true,            -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   '%',             -- schema filter --> '%' to load all schemas except 'information_schema' and 'pg_catalog' / '%publ%' to load all schemas like '%publ%'
   '%'              -- table filter --> '%' to load all tables / '%publ%' to load all tables like '%publ%'
);
--
--
--
--Troubleshooting error messages:
--Error message 1
--[ETL-5] JDBC-Client-Error: Connecting to 'jdbc:redshift://example_cluster123.some_region.redshift.amazonaws.com:5439/dev' as user='awsuser' failed: [Amazon](500150) Error setting/closing connection: Error loading the keystore . (Session: 1622834984232180908)
--
--Solution
--Ensure that the settings.cfg file contains the parameter NOSECURITY=YES.
--
--Error message 2
--[ETL-5] JDBC-Client-Error: Connecting to 'jdbc:redshift://example_cluster123.some_region.redshift.amazonaws.com:5439/dev' as user='awsuser' failed: [Amazon](500150) Error setting/closing connection: Connection timed out. (Session: 1622834984232180908)
--
--Solution
--Check that the security groups on the Redshift side allow your VM/cluster to connect to Redshift.
--
--Error message 3
--[ETL-5] JDBC-Client-Error: Connecting to 'jdbc:redshift://example_cluster123.some_region.redshift.amazonaws.com:5439/dev' as user='awsuser' failed: [Amazon](500150) Error setting/closing connection: UnknownHostException. (Session: 1622834984232180908)
--
--Solution
--Ensure that a DNS server is configured for the database.
--
--Error message 4
--[ETL-5] JDBC-Client-Error: Connecting to 'jdbc:redshift://example_cluster123.some_region.redshift.amazonaws.com:5439/dev' as user='awsuser' failed: SSL error: PKIX path validation failed: java.security.cert.CertPathValidatorException: validity check failed
--
--Solution
--Add ;ssl=false to the connection string. For example: jdbc:redshift://example_cluster123.some_region.redshift.amazonaws.com:5439/dev;ssl=false
