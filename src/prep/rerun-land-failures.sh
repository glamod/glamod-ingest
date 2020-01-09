#!/bin/bash

lotus_dir=/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/lotus-land
this_dir=$PWD

for i in `ls /gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/land/failure/*/*` ; do 
    fname=$(basename $i)
    year=$(echo $fname | cut -d- -f2)
    batch_id=$(echo $fname | cut -d\- -f3- | cut -d. -f1)

    logbase=${lotus_dir}/${batch_id}
    cmd="$this_dir/wrap-restructure-land.sh --wait -b $batch_id -y $year -vv"

    PREFIX="bsub -q short-serial -W 03:00 -o ${logbase}.out -e ${logbase}.err"
    cmd="$PREFIX $cmd"
    echo "RUNNING: $cmd"

    $cmd
done

