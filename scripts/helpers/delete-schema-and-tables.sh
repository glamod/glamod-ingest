#!/bin/bash

if [ ! "$PSQL_PREFIX" ]; then
    echo "[ERROR] Must define PSQL_PREFIX env variable...like..."
    echo "        psql -U <user> -h <host> <database>"
    exit
fi

schema=$1

if [ ! $schema ]; then
    echo "[ERROR] Must provide valid schema as argument!"
    exit
fi

echo "Really drop all tables/objects from: $schema? [Y/n] "
read RESP

if [ $RESP != "Y" ]; then
    echo "[WARN] Exited."
    exit
fi

echo "Start DELETING TABLES IN 10 seconds!!!! IT'S NOT TOO LATE TO STOP!!!"
sleep 10

for y in $(seq 1750 2020); do
    for d in land marine ; do
        for i in 0 2 3 ; do

            if [[ $schema =~ "lite" ]]; then
                tables="${schema}.observations_${y}_${d}_${i}"
            else
                tables="${schema}.observations_table_${y}_${d}_${i} ${schema}.header_table_${y}_${d}_${i}"
            fi

            for table in $tables; do
                $PSQL_PREFIX -c "DROP TABLE IF EXISTS ${table}"
            done

        done
    done
done

if [[ $schema =~ "lite" ]]; then
    tables="${schema}.observations"
else
    tables="${schema}.observations_table ${schema}.header_table"
fi

for table in $tables; do
    $PSQL_PREFIX -c "DROP TABLE IF EXISTS ${table}"
done
