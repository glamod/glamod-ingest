#!/bin/bash

script_dir=$(realpath $(dirname $0))
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py

release=$1
report_type=$2
mode=$3

if [ ! $release ]; then
    echo "[ERROR] Please provide release as first argument (e.g. 'r2.0')"
    exit
fi

if [ ! $report_type ] || [[ ! $report_type =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

if [ ! $mode ]; then 
    mode=local
    echo "[INFO] Setting run mode to 'local'."
fi

BASE_INPUT_DIR=$($config_script ${release}:lite:land:outputs:workflow)
lotus_dir=$($config_script ${release}:lite:land:sql:lotus)

echo "[INFO] Making output lotus directory: $lotus_dir"
mkdir -p $lotus_dir

queue=short-serial


for year in $(ls ${BASE_INPUT_DIR}/${report_type} | sort -r); do

    cmd="${script_dir}/create-sql-land-year.sh $release $report_type $year"
    sql_id="land-${report_type}-${year}-sql"
    lotus_base=$lotus_dir/$sql_id
    
    if [ $mode == 'batch' ]; then
        cmd="sbatch -p ${queue} --time=02:00 -o ${lotus_base}.out -e ${lotus_base}.err $cmd"
    fi

    echo "[INFO] Running: $cmd"
    $cmd

    if [ $? -ne 0 ]; then
        echo "[ERROR] Non-zero return code from: $cmd"
        exit
    fi
 
done
