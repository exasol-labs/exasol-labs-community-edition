/*
Apache Kafka Exasol Connector Extension

The Kafka Exasol Connector is an open-source project officially supported by Exasol, which provides an integration between Apache Kafka and Exasol.
It allows you to connect to Apache Kafka and import Apache Avro, JSON or String formatted data from Kafka topics into Exasol.

Read this blog: https://www.exasol.com/blog/exasol-kafka-connector/

Prerequisites
To integrate the Kafka application with Exasol, you need the following:

An operational Exasol cluster
An operational Kafka cluster
A connection between Exasol and Kafka clusters


The latest release of the Kafka Exasol Connector and all UDF scripts are already preinstalled and configured for you in this version of Exasol Community Edition.

Please find the relevant UDF scripts in the Database Schema EXTENSIONS:
KAFKA_CONSUMER
KAFKA_IMPORT
KAFKA_METADATA

Please do not change the UDF script names!


Follow these steps to import data from Apache Kafka:
https://github.com/exasol/kafka-connector-extension/blob/main/doc/user_guide/user_guide.md#record-format-configuration
https://docs.exasol.com/db/latest/loading_data/connect_sources/kafka_integration.htm#Importdata

Detailed documentation
https://docs.exasol.com/db/latest/loading_data/connect_sources/kafka_integration.htm
https://github.com/exasol/kafka-connector-extension/blob/main/doc/user_guide/user_guide.md
*/

-- Query the details of the relevant UDF scripts in the Database Schema EXTENSIONS:
SELECT 
    * 
FROM 
    EXA_ALL_SCRIPTS 
WHERE 
    SCRIPT_SCHEMA = 'EXTENSIONS' 
AND SCRIPT_NAME IN ('KAFKA_CONSUMER', 
                    'KAFKA_IMPORT', 
                    'KAFKA_METADATA');