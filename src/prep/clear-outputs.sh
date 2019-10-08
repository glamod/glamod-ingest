#!/bin/bash

dirs="/gws/nopw/j04/c3s311a_lot2/data/marine/r092019_cdm_lite/ICOADS_R3.0.0T/level1a 
/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/marine
/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/lotus-marine"


for dr in $dirs; do

    if [ -d $dr ]; then 
        echo "[WARN] Removing directory and its contents: $dr"
        rm -fr $dr
    fi

done
