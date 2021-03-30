## Re-structuring the input files

The first stage involves restructuring the input data so that the files are in a structure that can be directly loaded into PostgreSQL database partitions (using the `\COPY` SQL command). This involves grouping all the source decks data into single directories by year. The script is run on LOTUS and the intermediate data is written to the `/work/scratch-nopw/` directory:

```
cd $WORK_DIR/
git clone https:// github.com/glamod/glamod-ingest 
cd glamod-ingest/
export RELEASE=r2.0
nohup ./scripts/marine/prepare-all-marine-lite.sh $RELEASE batch 2>&1 > 
prepare.marine.output.txt &
```

These tasks are run on the high-memory nodes (as defined in the script) and can take up 24 hours to complete. The restructuring task also includes various, functions, checks and fixes such as:
- Merge header and observation records
- Set "report_type" to 0
- Set the "height_above_surface" value from input fields
- Interpret a number of missing value indicators and set to NULL

## Generating SQL scripts

After restructuring the files, a separate script is run as a set of LOTUS jobs to generate SQL scripts that will load the restructured pipe-separated (PSV) files:

```
cd $WORK_DIR/glamod-ingest/
./scripts/marine/create-sqls-marine.sh $RELEASE r2.0
```

This writes a set of commands to load entire PSV files directly in to database partitions, e.g.:

```
$ cat /gws/nopw/j04/c3s311a_lot2/data/ingest/marine/sql/0/load-0-1999.sql 
\cd '/work/scratch-nopw/astephen/glamod/r2.0/cdmlite/prepare/marine/1999/'
\COPY lite_2_0.observations_1999_marine_0 FROM '063-714-1999-r2.0-000000.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
\COPY lite_2_0.observations_1999_marine_0 FROM '100-792-1999-r2.0-000000.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
\COPY lite_2_0.observations_1999_marine_0 FROM '103-792-1999-r2.0-000000.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
\COPY lite_2_0.observations_1999_marine_0 FROM '112-926-1999-r2.0-000000.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
\COPY lite_2_0.observations_1999_marine_0 FROM '113-927-1999-r2.0-000000.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
\COPY lite_2_0.observations_1999_marine_0 FROM '114-992-1999-r2.0-000000.psv' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'
```

## Loading the data into the database partitions
The loader script is run as a single process for marine data. It is spawned under "nohup" so that it will complete even if the SSH connection to the server is interrupted:

```
cd $WORK_DIR/glamod-ingest/
nohup ./scripts/marine/load-marine-sql.sh 0 > load.marine.0.txt &
```

Log files are written to:

```
/gws/nopw/j04/c3s311a_lot2/data/ingest/marine/populate/
```

The logs can be analysed for any errors. A successful process will report the number of records copied into the database partition per PSV file, e.g.:

```
$ cat /gws/nopw/j04/c3s311a_lot2/data/ingest/marine/populate/load-0-1999.sql.log 
COPY 1964636
COPY 1175883
COPY 50241
COPY 4942575
COPY 172003
COPY 814021

```