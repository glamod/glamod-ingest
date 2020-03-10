#!/bin/bash

LOG_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/logs/land/populate/source_configuration
SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/sqls/land/source_configuration
mkdir -p $LOG_DIR $SQL_DIR

psv_file=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/source_configuration/source-configuration.psv
sql_file=$SQL_DIR/load-source-configuration.sql

echo "\\cd '$(dirname $psv_file)/'" > $sql_file
echo "\\COPY source_configuration FROM '$(basename $psv_file)' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

log=$LOG_DIR/source-configuration.log

echo "[INFO] Loading data from: $sql_file"
echo "[INFO] Logging to: $log"

psql -U glamod_root -h localhost cdm -f $sql_file  #> $log 2>&1 

