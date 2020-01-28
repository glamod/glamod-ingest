#!/bin/bash

REPORT_TYPE=$1

if [ ! $REPORT_TYPE ] || [[ ! $REPORT_TYPE =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

BASE_OUTPUT_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202001/land/cdmlite/${REPORT_TYPE}
BASE_SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/land/sql
lotus_dir=/gws/smf/j04/c3s311a_lot2/ingest/log/populate/lotus-land

mkdir -p $lotus_dir

mode=batch
#mode=local

for year in $(ls $BASE_OUTPUT_DIR | sort -r); do

    cmd="$PWD/create-sql-land-year.sh $REPORT_TYPE $year"
    sql_id="land-${REPORT_TYPE}-${year}-sql"
    lotus_base=$lotus_dir/$sql_id
    
    if [ $mode == 'batch' ]; then
        cmd="bsub -q short-serial -W 02:00 -o ${lotus_base}.out -e ${lotus_base}.err $cmd"
    fi

    echo "[INFO] Running: $cmd"
    $cmd
 
done
