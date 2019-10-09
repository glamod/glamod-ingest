#!/bin/bash

# count-marine-input-files.sh

hf=m-headers.txt
of=m-obs.txt

rm -f $hf

for i in `find /gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a -type d -name "???-???" | grep -v excluded | grep -v quicklooks | grep -v invalid | grep -v log` ; do  
 
    ls $i/header* | wc -l >> $hf
    
done


rm -f $of

for i in `find /gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a -type d -name "???-???" | grep -v excluded | grep -v quicklooks | grep -v invalid | grep -v log` ; do  

    ls $i/obs* | wc -l >> $of
    
done
