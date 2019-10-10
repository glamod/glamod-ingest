#!/bin/bash

dirs="/gws/nopw/j04/c3s311a_lot2/data/cdmlite/r201910/land
/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/land
/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/lotus-land"


for dr in $dirs; do

    if [ -d $dr ]; then 
        echo "[WARN] Removing directory and its contents: $dr"
        rm -fr $dr
    fi

done

rm -f last-land-batch.txt
