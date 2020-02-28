#!/usr/bin/env python

"""
make-cluster-sqls.py
====================

Writes sql scripts to cluster (sort) partitions.

"""


import sys
sys.path.append('.')

from _common import *


outfile = open('cluster-partitions.sql', 'w')

# generate child tables
for year in range(START_YEAR, END_YEAR + 1):

    for station, values in stations.items():
    
        if values['start'] > year: continue
    
        for report in values['report']:
        
           table_name = '{}.observations_{}_{}_{}'.format(schema, year, station, report)
           table_short = 'observations_{}_{}_{}'.format(year, station, report)
           
           idx_field = 'date_time'
           print('CLUSTER {} USING {}_{}_idx;'.format(table_name, table_short, idx_field), file=outfile) 
           print(f'[INFO] Worked on: {table_name}')
           
outfile.close()


