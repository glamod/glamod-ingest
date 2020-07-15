#!/bin/bash

script_dir=$(realpath $(dirname $0))
BASEDIR=$(dirname $script_dir)
config_script=${BASEDIR}/glamod-config.py

release=$1
mode=$2

if [ ! $release ]; then
    echo "[ERROR] Please provide release as first argument (e.g. 'r2.0')"
    exit
fi

if [ ! $mode ]; then 
    mode=local
fi

input_dir=$($config_script ${release}:lite:marine:incoming:header_table)
lotus_dir=$($config_script ${release}:lite:marine:outputs:lotus)

mkdir -p $lotus_dir

# Use high memory queue: to cope with big Pandas DataFrames in memory
queue="high-mem"


# Run tasks only in reduced mode
if [ $mode == 'reduced' ]; then
    data_dirs=$(echo "001-128" | xargs printf -- "${input_dir}/%s ")
    echo "[INFO] ONLY running on: $data_dirs"
#    mode=batch
else
    echo "[INFO] Running on all directories..."
    data_dirs=$(find $input_dir -maxdepth 1 -name "???-???")
fi


for dr in $data_dirs; do

    cmd="${script_dir}/restructure-marine.py -r $release -d $dr"
    
    if [ $mode == 'batch' ]; then

        sdir=$(basename $dr)
        logbase=${lotus_dir}/${sdir}
        cmd="sbatch -p ${queue} --time=18:00:00 -o ${logbase}.out -e ${logbase}.err $cmd"
        
    fi

    echo "[INFO] Running: $cmd"
    $cmd

done 
