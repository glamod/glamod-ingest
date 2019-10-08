#!/bin/bash

BASE_OUTPUT_DIR=/gws/nopw/j04/c3s311a_lot2/data/marine/r092019_cdm_lite/ICOADS_R3.0.0T/level1a
BASE_SQL_DIR=/gws/smf/j04/c3s311a_lot2/cdmlite/marine/sql

for ydir in $(find $BASE_OUTPUT_DIR -maxdepth 1 -name "[1-2][0-9][0-9][0-9]"); do

    echo CD ${ydir}/
    
    for fname in $(ls $ydir | sort -u); do
   
        echo $fname

    done

done
