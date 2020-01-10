#!/bin/bash

REPORT_TYPE=$1

if [ ! $REPORT_TYPE ] || [[ ! $REPORT_TYPE =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

BASE_SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/cdmlite/land/sql
sql_dir=$BASE_SQL_DIR/$REPORT_TYPE
LOG_DIR=/gws/nopw/j04/c3s311a_lot2/data/cdmlite/land/populate

mkdir -p $LOG_DIR

for sql in $(ls $sql_dir | sort -r); do

    log=$LOG_DIR/${sql}.log
    sql_file=$sql_dir/$sql

    base_dir=$(head -1 $sql_file | cut -d\' -f2)
    echo "[INFO] Gunzipping all under: $base_dir"
    gunzip $base_dir/*.psv.gz

    echo "[INFO] Loading data from: $sql_file"
    echo "[INFO] Logging to: $log"

    psql -U glamod_dbroot -h localhost cdmlite -f $sql_file > $log 2>&1 

    echo "[INFO] Gzipping all under: $base_dir"
    gzip $base_dir/*.psv

done
