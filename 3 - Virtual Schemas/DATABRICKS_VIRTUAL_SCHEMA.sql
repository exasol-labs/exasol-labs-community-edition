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

*/
-- DATABRICKS Virtual Schema
--
-- Prerequisites:
-- The DATABRICKS database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- DATABRICKS Virtual Schema Adapter Script:
-- The actual Adapter Script is already preinstalled for you
-- in the Schema VS_ADAPTERS in this version of Exasol Community Edition.
-- Documentation: https://github.com/exasol/databricks-virtual-schema/blob/main/doc/user_guide/user_guide.md
--
-- Create a connection to the DATABRICKS database:
-- For information about how to create a connection string, see "Create a Named Connection" in our GitHub repository.
-- Replace the connection string and credentials as needed.
--
-- https://github.com/exasol/databricks-virtual-schema/blob/main/doc/user_guide/user_guide.md#create-a-named-connection
--
--
-- Creating your own Virtual Schema:
--
CREATE VIRTUAL SCHEMA VS_DATABRICKS_MYSCHEMA
USING VS_ADAPTERS.DATABRICKS_ADAPTER WITH
    CONNECTION_NAME = 'DATABRICKS_JDBC_CONNECTION'
    CATALOG_NAME    = '<Databricks catalog name>'
    SCHEMA_NAME     = '<Databricks schema name>';
--
--
