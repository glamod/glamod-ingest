#!/bin/bash

for i in 0 2 3 ; do
    nohup ./get-monthly-counts.sh land $i > counts.land.${i}.txt &
done

nohup ./get-monthly-counts.sh marine 0 > counts.marine.0.txt &

