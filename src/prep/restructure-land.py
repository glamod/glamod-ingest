#!/usr/bin/env python

"""
restructure-land.py
===================

Restructures land data for the cdm-lite. 

Requires a JOIN between the Header table and the Observations table.

Join on fields: 
 - report_id

Function
--------

Data is found in: BASE_INPUT_DIR
It follows a structure: 

 {BASE_INPUT_DIR}/<stuff>/<table_type>_table_BETA_<primary_station_id>_<n>.<year>.psv

e.g.:

 /gws/nopw/j04/c3s311a_lot2/data/beta_fix7/header_table/daily/T1/header_table_BETA_ACW00011604_1/header_table_BETA_ACW00011604_1.1949.psv
 /gws/nopw/j04/c3s311a_lot2/data/beta_fix7/observations_table/daily/T1/observation_table_BETA_ACW00011604_1/observation_table_BETA_ACW00011604_1.1949.psv

Outputs are written to:

 {BASE_OUTPUT_DIR}/<report_type>/<year>/<batch_id>.<year>.psv
 
Sucess/Failure is indicated by file existence:

 {BASE_LOG_DIR}/success/<dr>/<year>-<revision>-<other>.psv
 {BASE_LOG_DIR}/failure/<dr>/<year>-<revision>-<other>.psv

For a given <batch_id>:
 - get list of header dirs
 - gather years:

 - for each <year>:
   - get header files
   - create dataframe list
   - derive output and log file paths
   - CHECK: if `success_file` exists: exit
   - for each <header>:
     - CHECK: observations file exists for each header file
     - get <observations>
     - merge <header> + <observations> on "report_id"
       - keeping all records in: observations     
       - CHECK: lengths of concatenated df equals sum of individual dfs
     - CHECK: there are no NULL values for "report_id"
     - append to dataframe list
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


# Output pattern = /gws/nopw/j04/c3s311a_lot2/data/cdmlite/r201910/land/<report_type>/<yyyy>/<report_type>-<yyyy>-<batch_id>.psv
BASE_OUTPUT_DIR = '/gws/nopw/j04/c3s311a_lot2/data/cdmlite/r201910/land'
BASE_LOG_DIR = '/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/land'

# For logging
VERBOSE = 0
DRY_RUN = False

hfields = ['report_type', 'platform_type', 'station_type',  'primary_station_id', 'station_name']

ofields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'observed_variable', 'units', 
'observation_value', 'value_significance', 'quality_flag']

merge_fields = ['report_id']
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

    
def get_df(paths, ftype):
    
    data_frames = [pd.read_csv(f, sep='|') for f in paths]

    # Drop duplicates
    [_.drop_duplicates(inplace=True) for _ in data_frames]

    if ftype == 'head':
        fields = hfields + merge_fields
    elif ftype == 'obs':
        fields = ofields + merge_fields
        
    droppers = [_ for _ in data_frames[0].columns if _ not in fields]
    data_frames = [_.drop(columns=droppers) for _ in data_frames]
    
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


def get_observations_files(headers):
    observers = [_.replace('header_table/', 'observations_table/') \
                  .replace('header_table', 'observation_table') \
                  for _ in headers]

    for observer in observers:
        if not os.path.isfile(observer):
            raise Exception(f'Obs file missing: {observer}')

    return observers


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


def process_year(batch_id, year, headers):
    """
   - get header files
   - create dataframe list
   - derive output and log file paths
   - CHECK: if `success_file` exists: exit
   - for each <header>:
     - CHECK: observations file exists for each header file
     - get <observations>
     - merge <header> + <observations> on "report_id"
       - keeping all records in: observations
       - CHECK: lengths of concatenated df equals sum of individual dfs
     - CHECK: there are no NULL values for "report_id"
     - append to dataframe list
     - CHECK: all time fields include a real value
   - concatenate dataframes into one
   - CHECK: final dataframe is the same size as the sum of its components
   - write to `output_file`
     - IF FAILURE: write `failure_file`
     - IF SUCCESS: write `success_file`
"""
    print(f'[INFO] Working on {year} for: {batch_id}')
    outputs = get_output_paths(batch_id, year)

    # CHECK: if `success_file` exists: return
    if os.path.isfile(outputs['success_path']): 
        print(f'[INFO] Success file exists: {outputs["success_path"]}')
        return

    try:
        observers = get_observations_files(headers)
    except Exception as err:
    # CHECK: observations file exists for each header file
        log('failure', outputs, str(err))
        return
  
    if VERBOSE: 
        print(f'[INFO] Reading header files:')
        for _ in headers:
            print(f'\tHEADER FILE: {_}')
    else:
        print(f'[INFO] Reading header files: {headers[0]} , etc.')

    head, _head_dfs = get_df(headers, 'head')
    # CHECK: lengths of concatenated df equals sum of individual dfs
    l_head = len(head)
    l_head_dfs = sum([len(_) for _ in _head_dfs]) 
    if not _equal_or_slightly_less(l_head, l_head_dfs):
        log('failure', outputs, f'Header data frame ({l_head}) length and individual frame lengths ({l_head_dfs}) need checking')
        return

    del _head_dfs

    if VERBOSE:
        print(f'[INFO] Reading observation files:')
        for _ in observers:
            print(f'\tOBSERVATIONS FILE: {_}')
    else:
        print(f'[INFO] Reading observation files: {observers[0]} , etc.')

    obs, _obs_dfs = get_df(observers, 'obs')
    # CHECK: lengths of concatenated df equals sum of individual dfs
    l_obs = len(obs)
    l_obs_dfs = sum([len(_) for _ in _obs_dfs])
    if not _equal_or_slightly_less(l_obs, l_obs_dfs):
        log('failure', outputs, f'Observation data frame ({l_obs}) length and individual frame lengths ({l_obs_dfs}) need checking')
        return

    del _obs_dfs

    print('[INFO] Merging files')
    # Merge header and observations tables, retaining all obs records
    merged = obs.merge(head, on=merge_fields, how='left')

    # CHECK: length of observations matches length of merged table
    l_obs = len(obs)
    l_merged = len(merged)

    if l_obs != l_merged:
        log('failure', outputs, f'Lengths of obs ({l_obs}) and merged ({l_merged}) are different.')
        return

    # Delete header and obs
    del head
    del obs
 
    # CHECK: there are no NULL values for "report_id" 
    null_fields = merged[merge_fields[0]].isnull().sum()
    if null_fields > 0:
        log('failure', outputs, f'Some merge fields ({merge_fields[0]}) are NULL after merge.')
        return

    # Remove the fields only required for merging
    merged = merged.drop(columns=merge_fields)

    # Make sure the time field is time
    merged[time_field] = pd.to_datetime(merged[time_field], utc=True) 

    # CHECK: all time fields include a real value
    obs_ids_of_bad_time_fields = merged[merged[time_field].isnull()]['observation_id'].unique().tolist()
    if len(obs_ids_of_bad_time_fields) > 0:
        log('failure', outputs, f'Some fields had missing value for {time_field}. Observation IDs were: '
                                f'{obs_ids_of_bad_time_fields}')
        return

    # Add height column
    fix_land_height(merged)
 
    # Modify platform type where it is not defined
    merged['platform_type'] = merged.apply(lambda x: _set_platform_type(x), axis=1) 
    
    # Add the location column
    merged['location'] = merged.apply(lambda x: 'SRID=4326;POINT({:.3f} {:.3f})'.format(x['longitude'], x['latitude']), axis=1)

    # Write output file
    if not DRY_RUN:
        print(f'[INFO] Writing output file: {outputs["output_path"]}')
        try:
            merged.to_csv(outputs['output_path'], sep='|', index=False, float_format='%.3f', 
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


def get_year_file_dict(batch_id, header_file=None):

    _batcher = _get_batcher()
    headers = _batcher.get(batch_id)

    # Filter if specific `header_file` is provided
    if header_file:
        headers = [_ for _ in headers if header_file in _] 

    resp = {}

    for head in headers:

        year = int(os.path.basename(head).split('.')[-2])
        resp.setdefault(year, [])
        resp[year].append(head) 
     
    return resp    


@click.command()
@click.option('--wait/--no-wait', default=False, help='Short wait (to avoid scheduling problems')
@click.option('--dry-run/--no-dry-run', default=False, help='Run without writing files (dry run)')
@click.option('-b', '--batch-id', 'batch_id', required=True, help='Batch to process.')
@click.option('-H', '--header-file', 'header_file', required=False, 
              help='Full file name of Header File (useful for identifying failures).')
@click.option('-y', '--year', 'year', required=False, type=int,
              help='Year to be processed (useful for identifying failures).')
@click.option('-v', '--verbose', 'verbose', count=True, help='Verbose output.')
def main(wait, dry_run, batch_id, header_file=None, year=None, verbose=0):
    """
    """

    # The `wait` argument is used when running in batch mode. Since the process starts
    # by reading the same headers file we don't want them all executing at the same time.

    if wait:
        print(f'[INFO] Pausing for {nap} seconds to vary header file reading...')
        time.sleep(nap)

    # Tidy up `header_file` if provided
    if header_file:
        header_file = os.path.basename(header_file).split('.')[0]

    global VERBOSE
    VERBOSE = verbose

    global DRY_RUN
    DRY_RUN = dry_run

    year_file_dict = get_year_file_dict(batch_id, header_file=header_file)    
    years = sorted(year_file_dict.keys())

    for yr in years:

        # If user specifies year then only process that one
        if year != None and yr != year: 
            continue

        header_files = year_file_dict[yr]
        process_year(batch_id, yr, header_files)


if __name__ == '__main__':

    main()
