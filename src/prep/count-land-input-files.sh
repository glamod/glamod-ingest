#!/bin/bash

# count-land-input-files.sh

hf=l-headers.txt
of=l-obs.txt

rm -f $hf

for d in $(find /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table -type d); do
 
    echo "Searching: $d"
    find $d -type f | wc -l >> $hf
    
done


rm -f $of

for d in $(find /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table -type d); do

    echo "Searching: $d"
    find $d -type f | wc -l >> $of
    
done

echo "Wrote: $hf AND $of"
