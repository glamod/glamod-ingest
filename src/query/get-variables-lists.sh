#!/bin/bash


DOMAINS=$1
REPORT_TYPES=$2

echo $DOMAINS $REPORT_TYPES

YEARS=$(seq 1753 2022)


for domain in $DOMAINS; do

    if [ $domain = "marine" ]; then
        YEARS=$(seq 1946 2022)
    fi

    for report_type in $REPORT_TYPES; do

            for year in $YEARS; do
                
                    SELECT="SELECT DISTINCT observed_variable FROM lite.observations_${year}_${domain}_${report_type};"
                    result=$(psql -t -q -U glamod_root -h localhost cdm -c "${SELECT}" | sed 's/ //g;')
 
                    echo "$result"
                    
        done
    done
done
