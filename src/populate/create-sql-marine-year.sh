#!/bin/bash

script_dir=$(realpath  $(pwd)/../../scripts/glamod-config.py)
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py

REPORT_TYPE=$1

year=$2
release=$3

if [ $# != 3 ]
then
	echo "Usage: <report type> <year> <release i.e. r2.0>"
	exit
fi

if [ ! $REPORT_TYPE ] || [[ ! $REPORT_TYPE =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

if [ ! $year ]; then 
    echo "[ERROR] Must provide year as second argument."
    exit
fi

#BASE_OUTPUT_DIR=/gws/nopw/j04/c3s311a_lot2/data/cdmlite/r201910/marine
#BASE_OUTPUT_DIR=/work/scratch-nompiio/astephen/glamod/r202001/cdmlite/marine
#todo: why can't these be supplied as args from the wrapper script....?
BASE_OUTPUT_DIR=$($config_script ${release}:lite:marine:outputs:workflow)

#${REPORT_TYPE}
#BASE_SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/cdmlite/r202001/marine/sql
#BASE_SQL_DIR=/gws/nopw/j04/c3s311a_lot2/data/ingest/marine/sql
BASE_SQL_DIR=$($config_script ${release}:lite:marine:outputs:sql)

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
   
    echo "\\COPY lite.observations_${year}_marine_${REPORT_TYPE} FROM '$fname' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

done

echo "[INFO] Wrote: $sql_file"

