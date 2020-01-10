#!/usr/bin/env python

"""
restructure-land.py
===================

Restructures land data for the cdm-lite. 

Function
--------


For a given <batch_id>:
 - get list of input files
 - gather years

 - for each <year>:
   - get input files
   - create dataframe list
   - derive output and log file paths
   - CHECK: if `success_file` exists: exit
   - CHECK: all time fields include a real value
   - concatenate dataframes into one
   - CHECK: final dataframe is the same size as the sum of its components
   - write to `output_file`
     - IF FAILURE: write `failure_file`
     - IF SUCCESS: write `success_file`

"""

import os, re, glob
import random, time

import pandas as pd
import click


# Output pattern = /gws/nopw/j04/c3s311a_lot2/data/ingest/r202001/land/cdmlite/<report_type>/<yyyy>/<report_type>-<yyyy>-<batch_id>.psv
BASE_OUTPUT_DIR = '/gws/nopw/j04/c3s311a_lot2/data/ingest/r202001/land/cdmlite'
BASE_LOG_DIR = '/gws/smf/j04/c3s311a_lot2/ingest/log/r202001/cdmlite/prep/land'

# For logging
VERBOSE = 0
DRY_RUN = False

inf_fields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning',
'observation_duration', 'longitude', 'latitude', 'report_type',
'height_above_surface', 'observed_variable', 'units', 'observation_value',
'value_significance', 'platform_type', 'station_type', 'primary_station_id', 'station_name',
'quality_flag', 'location']

time_field = 'date_time'

out_fields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'report_type', 
'height_above_surface', 'observed_variable', 'units', 'observation_value', 
'value_significance', 'platform_type', 'station_type', 'primary_station_id', 'station_name', 
'quality_flag', 'location']


from height_handler import fix_land_height
from land_batcher import LandBatcher

nap = random.randint(10, 180)
batcher = None


def _get_batcher():
    global batcher

    if not batcher:
        batcher = LandBatcher()

    return batcher

    
def get_df(paths):
    
    data_frames = [pd.read_csv(f, sep='|') for f in paths]

    # Drop duplicates
    [_.drop_duplicates(inplace=True) for _ in data_frames]

#    droppers = [_ for _ in data_frames[0].columns if _ not in fields]
#    data_frames = [_.drop(columns=droppers) for _ in data_frames]
    
    df = pd.concat(data_frames)

    # Drop duplicates in concatenated DataFrame
    df.drop_duplicates(inplace=True)
    return df, data_frames


def get_output_paths(batch_id, year):

    _batcher = _get_batcher()

    # BASE/<report_type>/<yyyy>/<report_type>-<yyyy>-<batch_id>.psv
    report_type = str(_batcher.get_report_type(batch_id))
    
    year_file = f'{report_type}-{year}-{batch_id}.psv'
    year = str(year)

    success_dir = os.path.join(BASE_LOG_DIR, 'success', report_type)
    failure_dir = os.path.join(BASE_LOG_DIR, 'failure', report_type)
    output_dir  = os.path.join(BASE_OUTPUT_DIR, report_type, year)

    for _ in success_dir, failure_dir, output_dir:
        if not os.path.isdir(_):
            os.makedirs(_)

    d = {'year_file': year_file,
         'output_path': os.path.join(output_dir, year_file),
         'success_path': os.path.join(success_dir, year_file),
         'failure_path': os.path.join(failure_dir, year_file)
        }

    return d


def log(log_type, outputs, msg=''):

    log_path = outputs[f'{log_type}_path']

    if not DRY_RUN:
        with open(log_path, 'w') as writer:
            writer.write(msg)

    log_level = {'success': 'INFO', 'failure': 'ERROR'}[log_type]
    message = msg or f'Wrote: {log_path}'
    print(f'[{log_level}] {message}') 

    if log_type == 'success':
        print(f'[{log_level}] Wrote success file: {log_path}')


def _set_platform_type(x):
    if pd.isnull(x['platform_type']):
        return 'NULL'

    return x['platform_type']


def _equal_or_slightly_less(a, b, threshold=5):
    if a == b: return True

    if (b - a) < 0 or (b - a) > threshold:
        return False

    print(f'[WARN] Lengths of main DataFrame ({a}) does not equal length of component DataFrames ({b}).')
    return True 


def process_year(batch_id, year, files):
    """
    """
    print(f'[INFO] Working on {year} for: {batch_id}')
    outputs = get_output_paths(batch_id, year)

    # CHECK: if `success_file` exists: return
    if os.path.isfile(outputs['success_path']): 
        print(f'[INFO] Success file exists: {outputs["success_path"]}')
        return

    if VERBOSE: 
        print(f'[INFO] Reading files:')
        for _ in files:
            print(f'\tINPUT FILE: {_}')
    else:
        print(f'[INFO] Reading input files: {files[0]} , etc.')

    df, _partial_dfs = get_df(files)

    # CHECK: lengths of concatenated df equals sum of individual dfs
    l_df = len(df)
    l_partial_dfs = sum([len(_) for _ in _partial_dfs]) 

    if not _equal_or_slightly_less(l_df, l_partial_dfs):
        log('failure', outputs, f'Data frame ({l_df}) length and individual frame lengths ({l_partial_dfs}) need checking')
        return

    del _partial_dfs

    # Make sure the time field is time
    df[time_field] = pd.to_datetime(df[time_field], utc=True) 

    # CHECK: all time fields include a real value
    obs_ids_of_bad_time_fields = df[df[time_field].isnull()]['observation_id'].unique().tolist()

    if len(obs_ids_of_bad_time_fields) > 0:
        log('failure', outputs, f'Some fields had missing value for {time_field}. Observation IDs were: '
                                f'{obs_ids_of_bad_time_fields}')
        return

    # Add height column
    fix_land_height(df)
 
    # Modify platform type where it is not defined
    df['platform_type'] = df.apply(lambda x: _set_platform_type(x), axis=1) 
    
    # Add the location column
    df['location'] = df.apply(lambda x: 'SRID=4326;POINT({:.3f} {:.3f})'.format(x['longitude'], x['latitude']), axis=1)

    # Write output file
    if not DRY_RUN:
        print(f'[INFO] Writing output file: {outputs["output_path"]}')
        try:
            df.to_csv(outputs['output_path'], sep='|', index=False, float_format='%.3f', 
                      columns=out_fields, date_format='%Y-%m-%d %H:%M:%S%z')
            log('success', outputs, msg=f'Wrote: {outputs["output_path"]}')

            # Remove any previous failure file if exists
            failure_file = outputs['failure_path']
            if os.path.isfile(failure_file):
                os.remove(failure_file)

        except Exception as err:
            log('failure', outputs, 'Could not write output to PSV file')

    else:
        print('[INFO] Not writing output in DRY RUN mode.')


def _read_years_from_gzipped_psv(fpath):
    print(f'[INFO] Reading: {fpath} to detect years.')
    df = pd.read_csv(fpath, sep='|')
    return sorted(list(set([_.year for _ in pd.to_datetime(df['date_time'], utc=True)])))


def get_year_file_dict(batch_id):

    _batcher = _get_batcher()
    files = _batcher.get(batch_id)

    resp = {}

    for f in files:
        years = _read_years_from_gzipped_psv(f) 

        for year in years:
            resp.setdefault(year, [])
            resp[year].append(f) 
     
    return resp    


@click.command()
@click.option('--wait/--no-wait', default=False, help='Short wait (to avoid scheduling problems')
@click.option('--dry-run/--no-dry-run', default=False, help='Run without writing files (dry run)')
@click.option('-b', '--batch-id', 'batch_id', required=True, help='Batch to process.')
@click.option('-y', '--year', 'year', required=False, type=int,
              help='Year to be processed (useful for identifying failures).')
@click.option('-v', '--verbose', 'verbose', count=True, help='Verbose output.')
def main(wait, dry_run, batch_id, year=None, verbose=0):
    """
    """

    # The `wait` argument is used when running in batch mode. Since the process starts
    # by reading the same input file we don't want them all executing at the same time.

    if wait:
        print(f'[INFO] Pausing for {nap} seconds to vary input file reading...')
        time.sleep(nap)

    global VERBOSE
    VERBOSE = verbose

    global DRY_RUN
    DRY_RUN = dry_run

    year_file_dict = get_year_file_dict(batch_id)
    years = sorted(year_file_dict.keys())

    for yr in years:

        # If user specifies year then only process that one
        if year != None and yr != year: 
            continue

        files = year_file_dict[yr]
        process_year(batch_id, yr, files)


if __name__ == '__main__':

    main()
