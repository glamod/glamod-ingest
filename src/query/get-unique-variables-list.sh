#!/bin/bash

for i in 0 2 3 ; do
    nohup ./get-variables-lists.sh land $i | sort -u > vars.land.${i}.txt &
done

nohup ./get-variables-lists.sh marine 0 | sort -u > vars.marine.0.txt &
