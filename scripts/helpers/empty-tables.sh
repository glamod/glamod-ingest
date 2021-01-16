#!/bin/bash

if [ ! "$PSQL_PREFIX" ]; then
    echo "[ERROR] Must define PSQL_PREFIX env variable...like..."
    echo "        psql -U <user> -h <host> <database>"
    exit
fi

schema=$1
frequency=$2

if [ ! $schema ]; then
    echo "[ERROR] Must provide valid schema as first argument!"
    exit
fi

frequency=$2

if [[ ! "$frequency" =~ [023] ]]; then
    echo "[ERROR] Must provide valid frequency as second argument!"
    exit
fi

echo "Really empty all tables from: $schema? [Y/n] "
read RESP

if [ $RESP != "Y" ]; then
    echo "[WARN] Exited."
    exit
fi

echo "Start DELETING TABLES IN 10 seconds!!!! IT'S NOT TOO LATE TO STOP!!!"
sleep 1

for y in $(seq 1750 2020); do
    #for d in land marine ; do
    for d in land; do
        #for i in 0 2 3 ; do
        for i in $frequency ; do

            if [[ $schema =~ "lite" ]]; then
                tables="${schema}.observations_${y}_${d}_${i}"
            else
                tables="${schema}.observations_table_${y}_${d}_${i} ${schema}.header_table_${y}_${d}_${i}"
            fi

            for table in $tables; do
                echo "[RUNNING] $PSQL_PREFIX -c 'DELETE FROM ${table};'"
                $PSQL_PREFIX -c "DELETE FROM ${table};"
            done

        done
    done
done


