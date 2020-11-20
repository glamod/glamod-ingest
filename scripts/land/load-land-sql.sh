#!/bin/bash

if [ ! "$PSQL_PREFIX" ]; then
    echo "[ERROR] Must define PSQL_PREFIX env variable...like..."
    echo "        psql -U <user> -h <host> <database>"
    exit
fi

script_dir=$(realpath $(dirname $0))
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py

# Check the host
#db_server=$($config_script db_server)

#if [ $(hostname) != $db_server ]; then
#    echo "[ERROR] This script must be run on the db server: ${db_server}"
#    exit
#fi

release=$1
report_type=$2

if [ ! $release ]; then
    echo "[ERROR] Please provide release as first argument (e.g. 'r2.0')"
    exit
fi

if [ ! $report_type ] || [[ ! $report_type =~ ^[023]$ ]]; then
    echo "[ERROR] Must provide report type of: 0, 2 or 3."
    exit
fi

# Get years as any extra command-line arguments
years=

n=0
for i in $@; do
    if [ $n -lt 2 ]; then
        let n+=1
        continue
    fi
    
    years="$years $i"
done

if [ "$years" ]; then
    echo "[INFO] Filtering years: $years"
fi

BASE_SQL_DIR=$($config_script ${release}:lite:land:sql:outputs)
sql_dir=${BASE_SQL_DIR}/${report_type}
LOG_DIR=$($config_script ${release}:lite:land:populate:outputs)

mkdir -p $LOG_DIR

for sql in $(ls $sql_dir | sort -r); do

    if [ "$years" ]; then
        matched_year=

        for year in $years; do
            if [[ $sql =~ "${year}" ]]; then
                echo "Matched requested year: $year"
                matched_year=1
                break
            fi
        done
    
        if [ ! "$matched_year" ]; then
            continue
        fi
    fi

    log=$LOG_DIR/${sql}.log
    sql_file=$sql_dir/$sql

    base_dir=$(head -1 $sql_file | cut -d\' -f2)

    echo "[INFO] Loading data from: $sql_file"
    echo "[INFO] Logging to: $log"

    cmd="${PSQL_PREFIX} -f $sql_file"
    echo "[INFO] Running: $cmd"
    $cmd > $log 2>&1 

done
