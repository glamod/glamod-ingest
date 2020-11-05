#!/bin/bash

batches_file=/gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/batches/cdmlite_batch_rules.txt
# Length: 15749

total_n=$(wc -l $batches_file | cut -d' ' -f1)
batch_length=100

n_batches=$(($total_n/$batch_length))

n=-999
n=$1

if [ $n -lt 1 ]; then
    echo "[ERROR] Provide a number between 1 and 100 as the input."
    exit
fi

start=$((($n-1)*$batch_length+2))
end=$(($start+$batch_length-1))

lines=$(awk "NR < $start {next} {print} NR==$end {exit}" $batches_file)

for line in $lines; do
    batch="$(echo $line | cut -d\| -f2)"
    echo "[INFO] Running for batch: $batch"
    /home/users/astephen/glamod/glamod-ingest/scripts/land/restructure-land.py -b $batch -r r2.0
done
