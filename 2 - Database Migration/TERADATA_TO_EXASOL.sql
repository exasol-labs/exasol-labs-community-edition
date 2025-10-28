-- TERADATA_TO_EXASOL Data Migration
--
-- Prerequisites:
-- The TERADATA database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- TERADATA_TO_EXASOL Database Migration Script:
-- The actual TERADATA_TO_EXASOL Database Migration Script is already preinstalled for you
-- in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
-- Source: https://github.com/exasol/database-migration/blob/master/teradata_to_exasol.sql
-- Further documentation: https://docs.exasol.com/db/latest/loading_data/connect_sources/teradata.htm
-- Teradata to Exasol Migration Guide: https://docs.exasol.com/db/latest/migration_guides/teradata/teradata_exasol.htm
--
-- Create a connection to the TERADATA database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
--
CREATE OR REPLACE CONNECTION TERADATA_JDBC
    TO 'jdbc:teradata://TERADATA_host_or_ip/CHARSET=UTF16'
    USER 'dbc'
    IDENTIFIED BY 'dbc';
--
-- To test the connection, run the following statement.
--
SELECT * FROM 
(
IMPORT FROM JDBC AT TERADATA_JDBC
STATEMENT 'SELECT ''Connection works'' '
);
--
/* 
     This script will generate create schema, create table and create import statements 
     to load all needed data from a TERADATA database. Automatic datatype conversion is 
     applied whenever needed. Copy out the generated statements and execute them in a separate
     SQL Commander window.
*/
--
EXECUTE SCRIPT DATABASE_MIGRATION.TERADATA_TO_EXASOL(
    'TERADATA_JDBC'        -- name of your database connection
    ,true                  -- case sensitivity handling for identifiers -> false: handle them case sensitive / true: handle them case insensitive --> recommended: true
    ,'%'                   -- schema filter --> '%' to load all schemas (except system schemas). Examples: 'CORE' (to migrate the 'CORE' schema), 'MART_%' (to migrate all schemas whose name starts with 'MART_')
    ,'%'                   -- table filter --> '%' to load all tables in the schemas considered. Examples: 'H_EMPLOYEE' (to migrate all the tables whose name is 'H_EMPLOYEE'), 'H_%' (to migrate all tables whose name starts with 'H_') 
    ,false                 -- boolean flag to create checking tables. TRUE -> create/load checking tables / FALSE -> do not create/load checking tables. -> default = FALSE. 
                           -- When the option is used, a checking table will be created and loaded for each individual table being migrated. 
                           -- The checking table will be created in the same schema with the same name adding '_MIG_CHK' as a suffix. 
                           -- A summary table for all the checking tables of a specific schema will be created in the database migration schema with the name of the migrated schema adding '_MIG_CHK' as a suffix.
)
;
