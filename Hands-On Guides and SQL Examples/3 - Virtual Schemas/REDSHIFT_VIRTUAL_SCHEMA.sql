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
-- REDSHIFT Virtual Schema
--
-- Prerequisites:
-- Amazon Redshift must be reachable from this Exasol database.
-- The user credentials in the connection must be valid.
--
-- JDBC Driver:
-- The actual JDBC Driver & settings.cfg File is already preinstalled for you
-- in the BucketFS in this version of Exasol Community Edition.
--
-- REDSHIFT Virtual Schema Adapter Script:
-- The actual Adapter Script is already preinstalled for you
-- in the Schema VS_ADAPTERS in this version of Exasol Community Edition.
-- Documentation: https://github.com/exasol/redshift-virtual-schema/blob/main/doc/user_guide/redshift_user_guide.md
--
-- Create a connection to the REDSHIFT database:
-- To create a connection, run the following statement.
-- Replace the connection string and credentials as needed.
-- The JDBC URL has the following format: jdbc:redshift://endpoint:port/database
-- See also https://docs.aws.amazon.com/redshift/latest/mgmt/jdbc20-obtain-url.html for more information.
-- See also: https://github.com/exasol/redshift-virtual-schema/blob/main/doc/user_guide/redshift_user_guide.md
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
-- Creating your own Virtual Schema:
--
CREATE VIRTUAL SCHEMA VS_REDSHIFT_MYSCHEMA
USING VS_ADAPTERS.REDSHIFT_ADAPTER WITH
    CONNECTION_NAME = 'REDSHIFT_JDBC'
    CATALOG_NAME = 'myredshiftdatabase'
    SCHEMA_NAME = 'myschema';
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
