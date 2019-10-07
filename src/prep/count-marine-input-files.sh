#!/bin/bash

# count-marine-input-files.sh

rm -f n-headers.txt

for i in `find /gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a -type d -name "???-???" | grep -v excluded | grep -v quicklooks | grep -v invalid | grep -v log` ; do  
 
    ls $i/header* | wc -l >> n-headers.txt 
    
done


rm n-obs.txt

for i in `find /gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a -type d -name "???-???" | grep -v excluded | grep -v quicklooks | grep -v invalid | grep -v log` ; do  

    ls $i/obs* | wc -l >> n-obs.txt
    
done
