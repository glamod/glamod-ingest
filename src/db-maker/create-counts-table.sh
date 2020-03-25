#!/bin/bash

echo "[INFO] Creating table: lite.record_counts"
CREATE="CREATE TABLE lite.record_counts (domain varchar, report_type int, var_code int, year int, month int, count int);"
psql -t -q -U glamod_root -h localhost cdm -c "$CREATE"


echo "[INFO] Populating from files..."
files="../query/counts.*.txt"


for fname in $files; do

    echo "[INFO] Loading from: $fname"
    while read LINE; do
    
        IFS=' ' read -a i <<< "$LINE"; echo
        
        domain="${i[0]}"
        report_type="${i[1]}"

        var_code=$(echo "${i[2]}" | sed 's/^0//;' | sed 's/://g;')

        year="${i[3]}"
        month=$(echo "${i[4]}" | sed 's/^0//;' | sed 's/://g;')

        count="${i[5]}"
        
        INSERT="INSERT INTO lite.record_counts VALUES ('${domain}', $report_type, $var_code, $year, $month, $count);"
        psql -U glamod_root -h localhost cdm -c "$INSERT"
        echo "[INFO] Inserted: $INSERT"

    done < $fname
done     
