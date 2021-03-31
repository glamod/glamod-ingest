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

start_year=$4

if [ ! "$start_year" ]; then
    start_year="1750"
fi

end_year=$(date +%Y)
echo "[INFO] Running on years: $start_year ... $end_year"

years=$(seq $start_year $end_year)
schema=$(echo $release | sed 's/\./_/g' | sed 's/r/lite_/g')


for domain in $domains; do

    for freq in $freqs; do

        for year in $years; do

            table="observations_${year}_${domain}_${freq}"

            if [ $($PSQL_PREFIX -t -c "SELECT EXISTS (SELECT FROM pg_tables WHERE schemaname = '${schema}' AND tablename = '${table}');") = 't' ]; then

                table_path="${schema}.${table}"
                indx="${table}_date_idx"

                echo "[INFO] Alter table: ${table_path}"
                $PSQL_PREFIX -c "ALTER TABLE ${table_path} ADD COLUMN IF NOT EXISTS date date;"

                echo "[INFO] Create Index: ${indx}"
                $PSQL_PREFIX -c "CREATE INDEX ${indx} ON ${table_path} (date);"

                echo "[INFO] Update dates for: ${table_path}"
                $PSQL_PREFIX -c "UPDATE ${table_path} SET date = date_trunc('day', date_time);"

                echo "[INFO] Done: ${table_path}"

            fi

        done 
        
    done

done
