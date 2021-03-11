#!/bin/bash

if [ ! "$PSQL_PREFIX" ]; then
    echo "[ERROR] Must define PSQL_PREFIX env variable...like..."
    echo "        psql -U <user> -h <host> <database>"
    exit
fi

release=$1

if [ ! "$release" ]; then
    echo "[ERROR] Please provide release as first argument (e.g. 'r2.0')"
    exit
fi

domain=$2

if [ ! "$domain" ]; then
    domains="land marine"
else
    domains=$domain
fi

echo "[INFO] Running on Domains: $domains"

freq=$3

if [ ! "$freq" ]; then
    freqs="0 2 3"
else
    freqs=$freq
fi

echo "[INFO] Running on Frequencies: $freqs"

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
