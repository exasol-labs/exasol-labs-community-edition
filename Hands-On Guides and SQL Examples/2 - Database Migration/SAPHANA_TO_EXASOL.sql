-- SAPHANA_TO_EXASOL Data Migration
--
-- Prerequisites:
-- The SAPHANA database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- SAPHANA_TO_EXASOL Database Migration Script:
-- The actual SAPHANA_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/sap_hana_to_exasol.sql
--
-- Create a connection to the SAPHANA database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
--
-- The standard port number format for different instances 3NN15,
-- NN- represents the instance number of HANA system to be used in client tools.
-- (eg. 31015 Instance No 10, 30015 Instance No 00)
-- In order to find out the instance number of your Hana-System type the following into your console:
-- /usr/sap/HXE and press Autocomplete by tab.
-- The Instance-Number should be displayed by the number of the HDB(XX)-File (eg. HDB90)
-- Insert the number into your port number (-> eg. 39015)
-- The Connection-String should look like the following: "jdbc:sap://'host_ip':'port'/" (User-ID: SYSTEM, Password: Your password)
--
CREATE OR REPLACE CONNECTION SAPHANA_JDBC
    TO 'jdbc:sap://hana01.example.com:30015/'
    USER 'SYSTEM'
    IDENTIFIED BY 'password';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT SAPHANA_JDBC
STATEMENT 'SELECT 1 from dummy'
);
--
/* 
     This script will generate create schema, create table and create import statements 
     to load all needed data from a SAPHANA database. Automatic datatype conversion is 
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.SAPHANA_TO_EXASOL(
   'SAPHANA_JDBC',  -- name of your database connection
   true,            -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
   '%',             -- schema filter --> '%' to load all schemas
   '%'              -- table filter --> '%' to load all tables
);
