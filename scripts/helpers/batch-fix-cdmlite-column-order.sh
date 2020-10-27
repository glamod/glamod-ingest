#!/bin/bash

base_dir=$1

if [ ! -f "$base_dir" ]; then
    echo "[ERROR] Must provide base directory as only argument!"
    exit
fi

find $base_dir -type f | xargs -n1 ./fix-in-place.sh