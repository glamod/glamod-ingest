#!/bin/bash


while read SQL ; do

    echo "[INFO] Running: $SQL"
    echo "START: $(date)"
    psql -U glamod_root -h localhost cdm -c "$SQL" 
    echo "END: $(date)"

done < cluster-partitions.sql
