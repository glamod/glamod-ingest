#!/usr/bin/env python

"""
make-indexes-sqls.py
====================

Writes sql scripts to create partition indexes.

"""


import sys
sys.path.append('.')

from _common import *


outfile = open('icreate-indexes.sql', 'w')

# generate child tables
for year in range(START_YEAR, END_YEAR + 1):

    for station, values in stations.items():
    
        if values['start'] > year: continue
    
        for report in values['report']:
        
           table_name = '{}.observations_{}_{}_{}'.format( schema, year, station, report )
           table_short = 'observations_{}_{}_{}'.format( year, station, report )
           
           for idx_field in ('date_time', 'observed_variable', 'location'): 
               print('CREATE INDEX {}_{}_idx ON {} ({});'.format(table_short, idx_field, table_name, idx_field), file=outfile) 

           print(f'[INFO] Worked on: {table_name}')
           
outfile.close()


