#!/bin/bash

LOG_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/logs/land/populate/organisation
SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/sqls/land/organisation
mkdir -p $LOG_DIR $SQL_DIR

psv_file1=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/organisation/organisation3.psv
sql_file=$SQL_DIR/load-organisation.sql

echo "\\cd '$(dirname $psv_file1)/'" > $sql_file
echo "\\COPY organisation FROM '$(basename $psv_file1)' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

log=$LOG_DIR/organisation.log

echo "[INFO] Loading data from: $sql_file"
echo "[INFO] Logging to: $log"

psql -U glamod_root -h localhost cdm -f $sql_file  #> $log 2>&1 

