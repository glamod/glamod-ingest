# Notes on loading the Postgres database (using COPY)

Here is a summary of how `psql` will work when encountering errors in 
records in PSV files that we are loading up.

## How do we load the data?

We use `psql`, e.g.:

```
psql -U <user> -h <host> cdm -f load.sql
```

Where the `load.sql` script is a `COPY` script, such as:

```
\cd '/usr/local/database_scripts/src/glamod-ingest/src/populate/test-load/'
\COPY lite.observations_1999_marine_0 FROM 'rubbish.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
\COPY lite.observations_1999_marine_0 FROM 'mixed.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
\COPY lite.observations_1999_marine_0 FROM 'good.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
```

In this case, we have:

 1. rubbish.psv - containing 3 bad records
 2. mixed.psv - contains 3 records, the second record is bad
 3. good.psv - contains 3 good records

## How will `psql` respond to BAD records

We found out:

 - If there are ANY bad records: NONE of the records will be loaded
 - But, subsequent PSV files in the loader script WILL be loaded 

