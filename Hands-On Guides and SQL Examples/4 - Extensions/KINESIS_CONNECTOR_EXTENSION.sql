/*
Amazon Kinesis Exasol Connector Extension

Kinesis Exasol Connector provides UDF scripts that allow users to import data from Kinesis Data Streams (KDS) to an Exasol table.
KDS is a real-time data streaming service provided by Amazon. It lets you continuously collect and temporarily store data from multiple sources. KDS provides SDKs for creating custom producing and consuming application.
This connector is a consumer that transfers the data from KDS to an Exasol table. Since the data in KDS is stored for a limited time you have to schedule Kinesis Connector to transfer the data regularly to avoid data loss.

Prerequisites
An AWS account with all necessary permissions to read from a Kinesis Stream.
AWS Access Keys
An AWS Kinesis producer which sends the data to a stream in the valid JSON format.

An example of a valid JSON string:

{"sensorId": 17,"currentTemperature": 147,"status": "WARN"}
See an example of an invalid JSON format. Note the trailing comma.

{"sensorId": 17,"currentTemperature": 147,"status": "WARN",}
The Kinesis Exasol Connector will not parse this string correctly.


The latest release of the Kinesis Exasol Connector and all UDF scripts are already preinstalled and configured for you in this version of Exasol Community Edition.

Please find the relevant UDF scripts in the Database Schema EXTENSIONS:
KINESIS_CONSUMER
KINESIS_IMPORT
KINESIS_METADATA

Please do not change the UDF script names!


Follow these steps to import data from Amazon Kinesis Data Streams:
https://github.com/exasol/kinesis-connector-extension/blob/main/doc/user_guide/user_guide.md#preparing-a-table-for-data

Detailed documentation
https://github.com/exasol/kinesis-connector-extension/blob/main/doc/user_guide/user_guide.md
*/

-- Query the details of the relevant UDF scripts in the Database Schema EXTENSIONS:
SELECT 
    * 
FROM 
    EXA_ALL_SCRIPTS 
WHERE 
    SCRIPT_SCHEMA = 'EXTENSIONS' 
AND SCRIPT_NAME IN ('KINESIS_CONSUMER', 
                    'KINESIS_IMPORT', 
                    'KINESIS_METADATA');