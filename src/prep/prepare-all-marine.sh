#!/bin/bash

mode=$1

if [ ! $mode ]; then 
    mode=local
fi


input_dir=/group_workspaces/jasmin2/glamod_marine/data/r092019/ICOADS_R3.0.0T/level2_lite_20200210
lotus_dir=/gws/smf/j04/c3s311a_lot2/cdmlite/log/r202001/prep/marine-lotus

mkdir -p $lotus_dir

# Use high memory queue: to cope with big Pandas DataFrames in memory
queue="high-mem"


# Run tasks only in reduced mode
if [ $mode == 'reduced' ]; then
    data_dirs=$(echo "001-128 110-700 114-992 063-714 112-926" | xargs printf -- "${input_dir}/%s ")
    echo "[INFO] ONLY running on: $data_dirs"
#    mode=batch
else
    echo "[INFO] Running on all directories..."
    data_dirs=$(find $input_dir -maxdepth 1 -name "???-???")
fi


for dr in $data_dirs; do

    cmd="$PWD/wrap-restructure-marine.sh -d $dr"
    
    if [ $mode == 'batch' ]; then

        sdir=$(basename $dr)
        logbase=${lotus_dir}/${sdir}
        cmd="bsub -q ${queue} -W 18:00 -o ${logbase}.out -e ${logbase}.err $cmd"

    fi

    echo $cmd
    $cmd

done 
