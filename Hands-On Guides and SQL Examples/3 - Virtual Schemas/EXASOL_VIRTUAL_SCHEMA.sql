/*

Virtual Schemas

What are virtual schemas?
Virtual schemas are an abstraction layer that makes external data sources accessible in our data analytics platform through regular SQL commands.
The contents of the external data sources are mapped to virtual tables that look like any regular Exasol tables and can be queried as such.

This concept creates a type of logical view on top of several data sources that could be databases or other data services.
Using the virtual schema, you can implement a consistent access layer for your reporting tools.
You can also use it for agile and flexible ETL processing, since there is no need to change anything in Exasol if you change or extend the objects in the underlying system.

How do I use virtual schemas?
After creating a virtual schema, you can use the virtual tables in SQL queries and combine them with persistent tables stored in Exasol, or with any other virtual table from a different virtual schema.
The SQL optimizer translates the virtual objects into connections to the underlying systems and implicitly transfers the required data.
SQL conditions are pushed to the data sources to ensure minimum data transfer and optimum performance.

The virtual schema translates the Exasol SQL into the SQL of the remote database.
Your query is rewritten into a new query that uses the IMPORT statement (https://docs.exasol.com/db/latest/sql/import.htm).
You can also load data directly using these generated statements.
To see the generated query, use the EXPLAIN VIRTUAL statement (https://docs.exasol.com/db/latest/sql/explain_virtual.htm).

Exasol provides an open and extensible framework where the connectivity logic is open sourced.
Within this framework you can choose to either use the available adapters or optimize them according to your requirements, without waiting for a new release from Exasol.


Supported Data Sources
Exasol supports many data sources for virtual schemas.
For more information and step-by-step instructions, see the Supported Dialects page on GitHub.
https://github.com/exasol/virtual-schemas/blob/main/doc/user_guide/dialects.md

*/
--
-- EXASOL Virtual Schema
--
-- Prerequisites:
-- The other Exasol database must be reachable from this Exasol database.
-- The port range from 20000 to 21000 must be opened in the other database if you want to use the native EXA interface.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- There is no need to install an Exasol JDBC driver. It is automatically integrated in the product.
--
-- Exasol Virtual Schema Adapter Script:
-- The actual Adapter Script is already preinstalled for you
-- in the Schema VS_ADAPTERS in this version of Exasol Community Edition.
-- Documentation: https://github.com/exasol/exasol-virtual-schema/blob/main/doc/dialects/exasol.md
--
-- Create a connection to the other Exasol database:
-- To create a connection, run one of the following statements.
-- Replace the connection string and credentials as needed.
-- If you use self-signed cerificates in your other Exasol database, make sure you add either the fingerprint
-- or the keyword nocertcheck in your connection string.
-- Additionally always make sure you add all your database nodes to the connection string.
-- See also: https://github.com/exasol/exasol-virtual-schema/blob/main/doc/dialects/exasol.md#choosing-the-type-of-connection

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
-- Creating your own Virtual Schema using EXA connection:
--
CREATE VIRTUAL SCHEMA VS_EXASOL_MYSCHEMA
USING VS_ADAPTERS.EXASOL_ADAPTER WITH
    CONNECTION_NAME                        = 'EXASOL_JDBC'
    SCHEMA_NAME                            = 'MYSCHEMA'
    IMPORT_FROM_EXA                        = 'true'
    EXA_CONNECTION                         = 'EXASOL_EXA'
    GENERATE_JDBC_DATATYPE_MAPPING_FOR_EXA = 'true'
    MAX_TABLE_COUNT = '3000';
--
--
-- Working Examples:
-- In this version of Exasol Community Edition we have already pre-configured
-- several Virtual Schemas to our Exasol Public Demo Database for you (https://www.exasol.com/cloud-testing/).
-- Simply test the several Virtual Schemas, make sure that your Community Edition is connected to the internet
-- and port 8563 is not blocked by your firewall.
-- You can also browse the contents of the Virtual Schemas with the DbVisualizer by expanding the "Virtual Schemas".
--
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_BANKING"."ACCOUNTS";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_FLIGHTS"."FLIGHTS";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_NYC_TAXI"."TRIPS";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_NYC_TAXI_FHVHV"."TAXI_TRIPS";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_PRESCRIPTIONS_UK"."PRESCRIPTIONS";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCDS_1000GB"."STORE_SALES";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCDS_100GB"."STORE_SALES";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCDS_10GB"."STORE_SALES";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCDS_1GB"."STORE_SALES";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCH_1000GB"."LINEITEM";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCH_100GB"."LINEITEM";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCH_10GB"."LINEITEM";
SELECT COUNT(*) FROM "VS_EXASOL_DEMODB_TPCH_1GB"."LINEITEM";
--
--
