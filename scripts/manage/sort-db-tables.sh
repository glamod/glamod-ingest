#!/bin/bash

if [ ! "$PSQL_PREFIX" ]; then
    echo "[ERROR] Must define PSQL_PREFIX env variable...like..."
    echo "        psql -U <user> -h <host> <database>"
    exit
fi

release=$1

if [ ! $release ]; then
    echo "[ERROR] Please provide release as first argument (e.g. 'r2.0')"
    exit
fi


domains="land marine"
freqs="0 2 3"
years=$(seq 1750 2020)

schema=$(echo $release | sed 's/\./_/g' | sed 's/r/lite_/g')


for domain in $domains; do

    for freq in $freqs; do

        for year in $years; do

            table="observations_${year}_${domain}_${freq}"

            if [ $($PSQL_PREFIX -t -c "SELECT EXISTS (SELECT FROM pg_tables WHERE schemaname = '${schema}' AND tablename = '${table}');") = 't' ]; then
                table_path="${schema}.${table}"
                indx="${table}_date_time_idx"
                echo "[INFO] Clustering (sorting): $table_path"
                echo "STARTED: $(date)"
                $PSQL_PREFIX -c "CLUSTER ${table_path} USING $indx;"
                echo "ENDED: $(date)"
            fi 
        done 
        
    done

done
