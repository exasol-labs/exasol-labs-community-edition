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
-- SAPHANA Virtual Schema
--
-- Prerequisites:
-- The SAPHANA database must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- SAPHANA Virtual Schema Adapter Script:
-- The actual Adapter Script is already preinstalled for you
-- in the Schema VS_ADAPTERS in this version of Exasol Community Edition.
-- Documentation: https://github.com/exasol/hana-virtual-schema/blob/main/doc/user_guide/user_guide.md
--
-- Create a connection to the SAPHANA database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
-- See also: https://github.com/exasol/hana-virtual-schema/blob/main/doc/user_guide/user_guide.md#defining-a-named-connection
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
-- Creating your own Virtual Schema:
--
CREATE VIRTUAL SCHEMA VS_SAPHANA_MYSCHEMA
USING VS_ADAPTERS.SAPHANA_ADAPTER WITH
    CONNECTION_NAME = 'SAPHANA_JDBC'
    SCHEMA_NAME = 'MYSCHEMA';
--
--
