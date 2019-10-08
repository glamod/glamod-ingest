#!/bin/bash

BASE_OUTPUT_DIR=/gws/nopw/j04/c3s311a_lot2/data/marine/r092019_cdm_lite/ICOADS_R3.0.0T/level1a
BASE_SQL_DIR=/gws/smf/j04/c3s311a_lot2/cdmlite/marine/sql
mkdir -p $BASE_SQL_DIR

for ydir in $(find $BASE_OUTPUT_DIR -maxdepth 1 -name "[1-2][0-9][0-9][0-9]"); do

    sql_file=${BASE_SQL_DIR}/load-$(basename $ydir).sql
    rm -f $sql_file

    echo "\\cd '$ydir/'" > $sql_file
    
    for fname in $(ls $ydir | sort -u); do
   
        echo "\\COPY lite.observations FROM '$fname' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

    done

    echo "[INFO] Wrote: $sql_file"

done
