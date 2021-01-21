#!/bin/bash

if [ ! "$PSQL_PREFIX" ]; then
    echo "[ERROR] Must define PSQL_PREFIX env variable...like..."
    echo "        psql -U <user> -h <host> <database>"
    exit
fi

script_dir=$(realpath $(dirname $0))
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py

REPORT_TYPE=$1

if [ ! $REPORT_TYPE ] || [[ ! $REPORT_TYPE =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

#BASE_SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/marine/sql
BASE_SQL_DIR=$($config_script ${release}:lite:marine:outputs:sql)
sql_dir=$BASE_SQL_DIR/$REPORT_TYPE
#LOG_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/marine/populate
LOG_DIR=$($config_script ${release}:lite:marine:outputs:populate)

mkdir -p $LOG_DIR


for sql in $(ls $sql_dir | sort -r); do

    year=$(echo $sql | cut -d. -f1 | cut -d\- -f3)
    if [ $year -gt 1945 ]; then
        echo "[INFO] Ignoring year: $year"
        continue
    fi

    log=$LOG_DIR/${sql}.log
    sql_file=$sql_dir/$sql

    echo "[INFO] Loading data from: $sql_file"
    echo "[INFO] Logging to: $log"

    $PSQL_PREFIX -f $sql_file > $log 2>&1 

done

