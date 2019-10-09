#!/usr/bin/env python

"""
cache-reduced-station-config.py
===============================

Reads the full station configuration file and caches a local version with only the 
required fields.

"""

import os
import pandas as pd


MAIN_STATION_CONFIGURATION = '/gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/station_configuration/station_configuration_Beta.psv'
CACHE_DIR = '../cache'

if not os.path.isdir(CACHE_DIR):
    os.makedirs(CACHE_DIR)


CACHED_STATION_CONFIGURATION = os.path.join(CACHE_DIR, 'station_configuration.psv')

fields = ['station_name', 'station_type', 'platform_type']

column_renamers = {
        'record_number': 'station_record_number',
        'primary_id':'primary_station_id'}

in_fields = fields + list(column_renamers.keys())
out_fields = fields + list(column_renamers.values())


def main():

    sc = pd.read_csv(MAIN_STATION_CONFIGURATION, sep='|', usecols=in_fields)
        
    for col in ['station_name']:
        sc[col] = sc[col].apply(lambda x: x.strip())

    sc = sc.rename(columns=column_renamers)
    sc.to_csv(CACHED_STATION_CONFIGURATION, sep='|', columns=out_fields, index=False)
    print(f'[INFO] Wrote: {CACHED_STATION_CONFIGURATION}')



if __name__ == '__main__':

    main()
