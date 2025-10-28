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
-- POSTGRESQL Virtual Schema
--
-- Prerequisites:
-- The POSTGRESQL database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- POSTGRESQL Virtual Schema Adapter Script:
-- The actual Adapter Script is already preinstalled for you
-- in the Schema VS_ADAPTERS in this version of Exasol Community Edition.
-- Documentation: https://github.com/exasol/postgresql-virtual-schema/blob/main/doc/user_guide/postgresql_user_guide.md
--
-- Create a connection to the POSTGRESQL database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
-- See also: https://github.com/exasol/postgresql-virtual-schema/blob/main/doc/user_guide/postgresql_user_guide.md#defining-a-named-connection
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
-- Creating your own Virtual Schema:
--
CREATE VIRTUAL SCHEMA VS_POSTGRESQL_MYSCHEMA
USING VS_ADAPTERS.POSTGRESQL_ADAPTER WITH
  CATALOG_NAME = 'mypostgresdatabase'
  SCHEMA_NAME = 'myschema'
  CONNECTION_NAME = 'POSTGRESQL_JDBC'
  POSTGRESQL_IDENTIFIER_MAPPING = 'CONVERT_TO_UPPER'
  IGNORE_ERRORS = 'POSTGRESQL_UPPERCASE_TABLES'
  MAX_TABLE_COUNT = '3000';
--
--
-- Working Example:
-- In this version of Exasol Community Edition we have already pre-configured
-- a POSTGRESQL Virtual Schema to a small demo POSTGRESQL DB for you.
-- Simply test the Virtual Schema, make sure that your Community Edition is connected to the internet
-- and port 5432 is not blocked by your firewall.
-- You can also browse the contents of the Virtual Schema with the DbVisualizer by expanding the "Virtual Schemas".
--
SELECT * FROM "VS_POSTGRESQL_EXASOLDEMO"."CUSTOMERS";
SELECT * FROM "VS_POSTGRESQL_EXASOLDEMO"."ORDERS";
SELECT * FROM "VS_POSTGRESQL_EXASOLDEMO"."PRODUCTS";
--
--
