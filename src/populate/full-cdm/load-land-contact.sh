#!/bin/bash

LOG_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/logs/land/populate/contact
SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/sqls/land/contact
mkdir -p $LOG_DIR $SQL_DIR

psv_file=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/contact/contact.psv
sql_file=$SQL_DIR/load-contact.sql

echo "\\cd '$(dirname $psv_file)/'" > $sql_file
echo "\\COPY contact FROM '$(basename $psv_file)' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

log=$LOG_DIR/contact.log

echo "[INFO] Loading data from: $sql_file"
echo "[INFO] Logging to: $log"

psql -U glamod_root -h localhost cdm -f $sql_file  #> $log 2>&1 

