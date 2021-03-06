#!/bin/bash

REPORT_TYPE=$1

if [ ! $REPORT_TYPE ] || [[ ! $REPORT_TYPE =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

year=$2

if [ ! $year ]; then 
    echo "[ERROR] Must provide year as second argument."
    exit
fi

BASE_OUTPUT_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/r202001/land/cdmlite/${REPORT_TYPE}
BASE_SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/land/sql


ydir=$BASE_OUTPUT_DIR/$year
echo $ydir
sql_dir=${BASE_SQL_DIR}/${REPORT_TYPE}
mkdir -p $sql_dir

sql_file=${sql_dir}/load-${REPORT_TYPE}-${year}.sql
rm -f $sql_file

# Ignore if no files present
if [ $(find $ydir -maxdepth 0 -empty) ]; then
    continue
fi

echo "\\cd '$ydir/'" > $sql_file
    
for fname in $(ls $ydir | sort -u); do
   
    if [[ $fname =~ .gz$ ]]; then
        fname="${fname%.*}"
    fi

    echo "\\COPY lite.observations_${year}_land_${REPORT_TYPE} FROM '$fname' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

done

echo "[INFO] Wrote: $sql_file"

