#!/bin/bash

for i in 0 2 3 ; do
    sleep 50
    nohup ./get-monthly-counts.sh land $i > counts.land.${i}.txt &
done

sleep 50
nohup ./get-monthly-counts.sh marine 0 > counts.marine.0.txt &

