import pandas as pd
import os
import sys

if len(sys.argv[1:]) != 3:
    print('[ERROR] Example use:')
    print('python -i lookup-source-config.py CA001091174 2 daily')
    sys.exit()

import re
pattn = re.compile(r'^(?P<primary_id>.+)-(?P<record_number>\d+)-(\d{4})-(\d{2})(-\d{2})?(-\d{2}:\d{2})?-\d+-\d+$')

sid, rn, freq = sys.argv[1:4]
rn = int(rn)

#CA001091174, 2, daily.
dr = '/gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/station_configuration'
sdsc = 'sub_daily_station_config_file_25_08_20.psv'
dmsc = 'daily_monthly_station_config_27_10_2020.psv'


if freq.lower().replace('-', '').replace('_', '') == 'subdaily':
    scf = os.path.join(dr, sdsc)
else:
    scf = os.path.join(dr, dmsc)

sc = pd.read_csv(scf, sep='|')

# match: primary_id and record_number in station_configuration
station_records = sc[(sc.primary_id == sid) & (sc.record_number == rn)]

matched = list(set(station_records['source_id']))

if len(matched) != 1: 
    print('BAD')
else:
    print('GOOD')
