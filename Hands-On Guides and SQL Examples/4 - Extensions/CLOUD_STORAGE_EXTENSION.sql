/*
Exasol Cloud Storage Extension

Exasol Cloud Storage Extension enables you to easily transfer formatted data between Exasol and cloud storage systems such as Amazon S3, Azure Blob Storage, and Google Cloud Storage.

Features
Supports the following data formats for importing: Apache Avro, Apache Orc and Apache Parquet.
Allows data import from Delta Lake.
Supports table export as Apache Parquet format to public cloud storage systems.
Supports the following cloud storage systems: Amazon S3, Google Cloud Storage, Azure Blob Storage, Azure Data Lake (Gen1) Storage and Azure Data Lake (Gen2) Storage.
Supports Hadoop Distributed Filesystem (HDFS) and Alluxio filesystems.
Allows configuration of parallel importer or exporter processes.


The latest release of the Exasol Cloud Storage Extension and all UDF scripts are already preinstalled and configured for you in this version of Exasol Community Edition.

Please find the relevant UDF scripts in the Database Schema EXTENSIONS:
IMPORT_METADATA
IMPORT_PATH
IMPORT_FILES
EXPORT_PATH
EXPORT_TABLE

Please do not change the UDF script names!


Follow these steps to import or export data:
https://github.com/exasol/cloud-storage-extension/blob/main/doc/user_guide/user_guide.md#prepare-an-exasol-table-for-import
https://docs.exasol.com/db/latest/loading_data/other_file_formats.htm#Usageexamples

Detailed documentation
https://docs.exasol.com/db/latest/loading_data/other_file_formats.htm
https://github.com/exasol/cloud-storage-extension/blob/main/doc/user_guide/user_guide.md
*/

-- Query the details of the relevant UDF scripts in the Database Schema EXTENSIONS:
SELECT 
    * 
FROM 
    EXA_ALL_SCRIPTS 
WHERE 
    SCRIPT_SCHEMA = 'EXTENSIONS' 
AND SCRIPT_NAME IN ('IMPORT_METADATA', 
                    'IMPORT_PATH', 
                    'IMPORT_FILES',
                    'EXPORT_PATH',
                    'EXPORT_TABLE');