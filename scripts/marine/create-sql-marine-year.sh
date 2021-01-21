#!/bin/bash

script_dir=$(realpath $(dirname $0))
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

schema=$(echo $release | sed 's/\./_/g' | sed 's/r/lite_/')
BASE_OUTPUT_DIR=$($config_script ${release}:lite:marine:outputs:workflow)
BASE_SQL_DIR=$($config_script ${release}:lite:marine:outputs:sql)

ydir=$BASE_OUTPUT_DIR/$year
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
   
    echo "\\COPY ${schema}.observations_${year}_marine_${REPORT_TYPE} FROM '$fname' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

done

echo "[INFO] Wrote: $sql_file"

