/*
Post load optimization - CONVERT_DATATYPES Script

This very useful script creates datatype optimizations for you.
You can run this after importing your data into Exasol.
Selecting smaller datatypes might improve performance.

This script:
  - looks at all columns of type 'DOUBLE' and converts them to numbers
        if only integer values are contained in the columns.
  - looks at all columns of type 'DECIMAL' and converts them to a smaller type
        of decimal if a smaller datatype is also sufficient.
  - looks at all columns of type 'TIMESTAMP' and converts them to date
        if only date values are contained in the columns.
  - looks at all columns of type 'VARCHAR' and converts them to a smaller type
    of varchar if a smaller VARCHAR can still hold the information in the column

Read the full documentation here:
https://github.com/exasol/database-migration/tree/master/post_load_optimization

It is already preinstalled for you in the Schema DATABASE_MIGRATION in this version of Exasol Community Edition.
*/

-- If executed with 'false' --> Script only displays what changes would be made
EXECUTE SCRIPT DATABASE_MIGRATION.CONVERT_DATATYPES(
'MY_SCHEMA', --schema_name:      SCHEMA name or SCHEMA_FILTER (can be %)
'%',         --table_name:       TABLE name or TABLE_FILTER  (can be %)        
false        --apply_conversion: If false, only output of what would be changed is generated, if true conversions are applied
);
