#!/bin/bash

script_dir=$(dirname $0)
base_dir=$1

if [ ! -d "$base_dir" ]; then
    echo "[ERROR] Must provide base directory as only argument!"
    exit
fi

for f in $(find $base_dir -type f); do
    /home/users/astephen/glamod/glamod-ingest/scripts/helpers/fix-cdmlite-column-order.sh $f
done

