#!/bin/bash


#DOMAINS="land marine"
#REPORT_TYPES="0 2 3"
DOMAINS=$1
REPORT_TYPES=$2

VARIABLES=""

YEARS=$(seq 1761 2019)
MONTHS=$(seq 1 12)


for domain in $DOMAINS; do

    if [ $domain = "marine" ]; then
        REPORT_TYPES="0"
        YEARS=$(seq 1946 2019)
    fi

    for report_type in $REPORT_TYPES; do

        if [ $domain = "land" ]; then
           if [ $report_type = "0" ]; then
               VARIABLES="36 57 58 85 106 107"
           elif [ $report_type = "2" ]; then
               VARIABLES="44 55 85 107"
           elif [ $report_type = "3" ]; then
               VARIABLES="44 45 53 55 85 106 107"
           fi
        else
            VARIABLES="36 58 85 95 106 107"
        fi

        for variable in $VARIABLES; do

            for year in $YEARS; do
                for month in $MONTHS; do
                
                    month=$(printf "%02d" $month)
                    LAST_DAY=$(cal $month $year | awk 'NF {DAYS = $NF}; END {print DAYS}')
                    SELECT="SELECT COUNT(*) FROM lite.observations_${year}_${domain}_${report_type}"
                    
                    # BETWEEN is inclusive of bounds
                    WHERE="WHERE date_time BETWEEN '${year}-${month}-01 00:00:00+00' AND '${year}-${month}-${LAST_DAY} 23:59:59+00';"
                    result=$(psql -t -q -U glamod_root -h localhost cdm -c "${SELECT} ${WHERE}")
 
                    echo "$domain $report_type $variable $year $month: $result"
                    
                done
            done
        done
    done
done
