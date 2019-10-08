#!/bin/bash

mode=$1

if [ ! $mode ]; then 
    mode=local
fi


input_dir=/gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a
lotus_dir=/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/lotus-marine
mkdir -p $lotus_dir


data_dirs=$(find $input_dir -maxdepth 1 -name "???-???")

for dr in $data_dirs; do

    cmd="./wrap-restructure-marine.sh -d $dr"
    
    if [ $mode == 'batch' ]; then

        sdir=$(basename $dr)
        logbase=${lotus_dir}/${sdir}
        cmd="bsub -q short-serial -W 02:00 -o ${logbase}.out -e ${logbase}.err $cmd"

    fi

    echo $cmd
    $cmd

done 
