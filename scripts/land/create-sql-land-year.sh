#!/bin/bash

script_dir=$(realpath $(dirname $0))
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py

release=$1
report_type=$2
year=$3


if [ ! $release ]; then
    echo "[ERROR] Please provide release as first argument (e.g. 'r2.0')"
    exit
fi

if [ ! $report_type ] || [[ ! $report_type =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

if [ ! $year ]; then 
    echo "[ERROR] Must provide year as second argument."
    exit
fi

schema=$(echo $release | sed 's/\./_/g' | sed 's/r/lite_/')

INPUT_DIR=$($config_script ${release}:lite:land:outputs:workflow)/${report_type}
BASE_SQL_DIR=$($config_script ${release}:lite:land:sql:outputs)

ydir=${INPUT_DIR}/$year

sql_dir=${BASE_SQL_DIR}/${report_type}

echo "[INFO] Making: ${sql_dir}"
mkdir -p $sql_dir

sql_file=${sql_dir}/load-${report_type}-${year}.sql
rm -f $sql_file

# Ignore if no files present
if [ ! -d $ydir ] || [ $(find $ydir -maxdepth 0 -empty) ]; then
    exit
fi

echo "\\cd '$ydir/'" > $sql_file
    
for fname in $(ls $ydir | sort -u); do
   
    if [[ $fname =~ .gz$ ]]; then
        fname="${fname%.*}"
    fi

    echo "\\COPY ${schema}.observations_${year}_land_${report_type} FROM '$fname' WITH CSV HEADER DELIMITER AS '|' NULL AS 'NULL'" >> $sql_file

done

echo "[INFO] Wrote: $sql_file"

