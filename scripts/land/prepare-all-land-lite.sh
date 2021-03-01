#!/bin/bash

script_dir=$(realpath $(dirname $0))
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py
scr=${script_dir}/restructure-land.py

release=$1
mode=$2

if [ ! $release ]; then
    echo "[ERROR] Please provide release as first argument (e.g. 'r2.0')"
    exit
fi

if [ ! $mode ]; then 
    mode=local
    echo "[INFO] Setting run mode to 'local'."
fi

lotus_dir=$($config_script ${release}:lite:land:outputs:lotus)

if [ ! $lotus_dir ] ; then
    echo "[WARN] Found lotus_dir: ${lotus_dir}"
    echo "[ERROR] Cannot find lotus directory variable."
    exit
fi

echo "[INFO] Making LOTUS directory: ${lotus_dir}"
mkdir -p $lotus_dir

NAP=20 # seconds to nap before starting
LAST_BATCH_FILE=./last-land-batch.txt

# Use high memory queue: to cope with big Pandas DataFrames in memory
queue="high-mem"
duration="47:00:00"
#queue="short-serial"
#duration="18:00:00"

batches=$(${script_dir}/get-all-land-batches.py $release)
new_batches=0

# Now loop through all the batches
for batch_id in $batches; do

    # Check if re-run from here
    if [ ! -f $LAST_BATCH_FILE ]; then
        new_batches=1
    fi

    if [ -f $LAST_BATCH_FILE ] && [ "$(cat $LAST_BATCH_FILE)" == "$batch_id" ]; then 
        new_batches=1
        echo "[INFO] Found batch to resume after..."
        continue
    fi

    if [ $new_batches -eq 0 ]; then
        echo "[WARN] Batch already submitted: $batch_id"
        continue 
    fi
 
    WAIT=""
    PREFIX=""
 
    if [ $mode == 'batch' ]; then

        WAIT="--wait"
        logbase=${lotus_dir}/${batch_id}
        PREFIX="sbatch -p ${queue} --time=${duration} -o ${logbase}.out -e ${logbase}.err"

    fi

    cmd="$PREFIX $scr $WAIT -r $release -b $batch_id"
    echo "[INFO] Running: $cmd"
    $cmd

    echo $batch_id > $LAST_BATCH_FILE

    njobs=$(squeue -u $USER | wc -l)

    while [ $njobs -gt 250 ]; do 
        echo "[INFO] Sleeping for a while..."
        sleep $NAP
        njobs=$(squeue -u $USER | wc -l)
    done

done


