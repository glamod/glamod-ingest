#!/bin/bash

mode=$1
scr=./wrap-restructure-land.sh

if [ ! $mode ]; then 
    mode=local
fi


lotus_dir=/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/lotus-land
mkdir -p $lotus_dir

cd /gws/smf/j04/c3s311a_lot2/astephen/glamod-cdm-lite/
source venv/bin/activate
cd src/prep/

batches=$(python get-all-land-batches.py)

for batch_id in $batches; do

    cmd="$scr --wait -b $batch_id"
    
    if [ $mode == 'batch' ]; then

        logbase=${lotus_dir}/${batch_id}
        cmd="bsub -q short-serial -W 02:00 -o ${logbase}.out -e ${logbase}.err $scr --wait -b $batch_id"

    fi

    echo $cmd
    $cmd

done 
