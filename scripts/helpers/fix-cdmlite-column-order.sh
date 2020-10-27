#!/bin/bash

input_file=$1

if [ ! -f "$input_file" ]; then
    echo "[ERROR] Must provide input file as only argument!"
    exit
fi

# Check that it hasn't already been fixed
if [[ $(head -1 "$input_file") =~ "source_id|location" ]]; then
    echo "[WARN] Already fixed so exit!"
    exit
fi

#input_file="0-2019-sub_daily-CDM_lite_SecondRelease_AAI0000TN.psv"
tmp_file=${input_file}.tmp

awk -F'|' '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$20,$19}' OFS='|' $input_file > $tmp_file 

echo "[INFO] Wrote: $tmp_file"

mv -f $tmp_file $input_file

echo "[INFO] Replaced: $input_file"