#!/bin/bash

mode=$1
scr=$PWD/wrap-restructure-land.sh

if [ ! $mode ]; then 
    mode=local
fi

NAP=20
LAST_BATCH_FILE=last-land-batch.txt
lotus_dir=/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/lotus-land
mkdir -p $lotus_dir

cd /gws/smf/j04/c3s311a_lot2/astephen/glamod-cdm-lite/
source venv/bin/activate
cd src/prep/

batches=$(python get-all-land-batches.py)
new_batches=0

for batch_id in $batches; do

    # Check if re-run from here
    if [ ! -f $LAST_BATCH_FILE ]; then
        new_batches=1
    fi

    if [ -f $LAST_BATCH_FILE ] && [ $(cat $LAST_BATCH_FILE) == $batch_id ]; then 
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
        PREFIX="bsub -q short-serial -W 03:00 -o ${logbase}.out -e ${logbase}.err "

    fi

    cmd="$PREFIX $scr $WAIT -b $batch_id"
    echo "[INFO] Running: $cmd"
    $cmd

    echo $batch_id > $LAST_BATCH_FILE

    njobs=$(bjobs | wc -l)

    while [ $njobs -gt 250 ]; do 
        echo "[INFO] Sleeping for a while..."
        sleep $NAP
        njobs=$(bjobs | wc -l)
    done

done

