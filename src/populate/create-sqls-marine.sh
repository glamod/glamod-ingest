#!/bin/bash

REPORT_TYPE=0

if [ ! $REPORT_TYPE ] || [[ ! $REPORT_TYPE =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

BASE_OUTPUT_DIR=/gws/nopw/j04/c3s311a_lot2/data/cdmlite/r201910/marine
#/${REPORT_TYPE}
BASE_SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/cdmlite/marine/sql
lotus_dir=/gws/smf/j04/c3s311a_lot2/cdmlite/log/populate/lotus-marine

mkdir -p $lotus_dir

mode=batch
#mode=local

for year in $(ls $BASE_OUTPUT_DIR | sort -r); do

    cmd="$PWD/create-sql-marine-year.sh $REPORT_TYPE $year"
    sql_id="marine-${REPORT_TYPE}-${year}-sql"
    lotus_base=$lotus_dir/$sql_id
    
    if [ $mode == 'batch' ]; then
        cmd="bsub -q short-serial -W 02:00 -o ${lotus_base}.out -e ${lotus_base}.err $cmd"
    fi

    echo "[INFO] Running: $cmd"
    $cmd
 
done
