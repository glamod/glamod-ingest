#!/bin/bash
d=/home/users/astephen/glamod/glamod-ingest

if [ "$1" ]; then
    batches=$@
    p="high-mem"
    t="36:00:00"
else
    batches=$(seq 1 158)
    p="short-serial"
    t="23:59:59"
fi


for i in $batches; do

    stdout=${d}/${i}.out
    stderr=${d}/${i}.err
    rm -f $stdout $stderr
    
    sbatch -p $p --time=${t} -o $stdout -e $stderr ./scripts/helpers/restructure-batches-100s.sh $i

done
