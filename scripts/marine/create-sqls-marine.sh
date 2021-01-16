#!/bin/bash

script_dir=$(realpath $(dirname $0))
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py

REPORT_TYPE=$1

release=$2

if [ $# != 2 ]
then
	echo "Usage: <report type> <release i.e. r2.0>"
	exit
fi


if [ ! $REPORT_TYPE ] || [[ ! $REPORT_TYPE =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

BASE_OUTPUT_DIR=$($config_script ${release}:lite:marine:outputs:workflow)
lotus_dir=$($config_script ${release}:lite:marine:outputs:lotus)

queue="high-mem"

mkdir -p $lotus_dir

#mode=batch
mode=local

for year in $(ls $BASE_OUTPUT_DIR | sort -r); do

    cmd="${script_dir}/create-sql-marine-year.sh $REPORT_TYPE $year $release"

    sql_id="marine-${REPORT_TYPE}-${year}-${release}-sql"
    lotus_base=$lotus_dir/$sql_id

    if [ $mode == 'batch' ]; then
        cmd="sbatch -p ${queue} --time=18:00:00 -o ${lotus_base}.out -e ${lotus_base}.err $cmd"
    fi

    echo "[INFO] Running: $cmd"
    $cmd
 
done
