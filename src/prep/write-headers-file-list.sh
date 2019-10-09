#!/bin/bash

OUTDIR=../data
mkdir -p $OUTDIR

OUTFILE=$OUTDIR/header_files.txt

find /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table -type f > $OUTFILE

echo "[INFO] Wrote: $OUTFILE"
