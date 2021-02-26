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

import glamod.settings as gs
import glamod.prepare.utils as prep_utils
import glamod.utils.pickle_dict as pdict


RELEASE = None

# Set global variables for paths, these will be created when 
# the "release" is known
BASE_OUTPUT_DIR = None
BASE_LOG_DIR = None

# Set global for pickled dictionary of cached years
YEARS_DICT = None

# For logging
VERBOSE = 0
DRY_RUN = False

time_field = 'date_time'

out_fields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'report_type', 
'height_above_surface', 'observed_variable', 'units', 'observation_value', 
'value_significance', 'platform_type', 'station_type', 'primary_station_id', 'station_name', 
'quality_flag', 'source_id', 'location']


from glamod.prepare.height_handler import fix_land_height
from glamod.prepare.land_batcher import LandBatcher

nap = random.randint(10, 180)
batcher = None


def initialise(release):
    if release not in gs.RELEASES:
        raise ValueError(f'Release {release} is not valid, must be one of: {gs.RELEASES.keys()}')

    # Initalise global variables based on the release
    global RELEASE
    global BASE_OUTPUT_DIR
    global BASE_LOG_DIR
    global YEARS_DICT

    RELEASE = release

    BASE_OUTPUT_DIR = gs.get(f'{release}:lite:land:outputs:workflow')
    BASE_LOG_DIR = gs.get(f'{release}:lite:land:outputs:log')

    years_dict_file = gs.get(f'{release}:lite:land:batches:years')
    YEARS_DICT = pdict.PickleDict(years_dict_file)


def _get_batcher():
    global batcher

    if not batcher:
        batcher = LandBatcher(RELEASE)

    return batcher

    
def get_df(paths, year):
    """
    Reads a list of paths, parses data into DataFrames, filters by year, then 
    Concatenates them together.

    Returns: (DataFrame, [list of sub-DataFrames])
    """
    
    data_frames = [pd.read_csv(f, sep='|', parse_dates=[time_field]) for f in paths]

    # Only keep the required `year`
    print(f'[INFO] Lengths of data frames before filtering years: {[len(_) for _ in data_frames]}')
    data_frames = [_[_.date_time.dt.year == year] for _ in data_frames]

    print(f'[INFO] Lengths of data frames AFTER filtering years: {[len(_) for _ in data_frames]}')

    # Drop duplicates
    [_.drop_duplicates(inplace=True) for _ in data_frames]
    
    df = pd.concat(data_frames)

    # Drop duplicates in concatenated DataFrame
    df.drop_duplicates(inplace=True)
    return df, data_frames


def get_report_type(batch_id):
    _batcher = _get_batcher()
    return _batcher.get_report_type(batch_id)


def get_output_paths(batch_id, year):

    # BASE/<report_type>/<yyyy>/<report_type>-<yyyy>-<batch_id>.psv
    report_type = str(get_report_type(batch_id))
    
    year_file = f'{report_type}-{year}-{batch_id}.psv'
    gzip_file = f'{year_file}'

    year = str(year)

    success_dir = os.path.join(BASE_LOG_DIR, 'success', report_type)
    failure_dir = os.path.join(BASE_LOG_DIR, 'failure', report_type)
    output_dir  = os.path.join(BASE_OUTPUT_DIR, report_type, year)

    for _ in success_dir, failure_dir, output_dir:
        if not os.path.isdir(_):
            os.makedirs(_)

    d = {'output_path':  os.path.join(output_dir, gzip_file),
         'success_path': os.path.join(success_dir, year_file),
         'failure_path': os.path.join(failure_dir, year_file)
        }

    return d


def _set_platform_type(x):
    if pd.isnull(x['platform_type']):
        return 'NULL'

    return x['platform_type']


def process_year(batch_id, year, files):
    """
    """
    print(f'[INFO] Working on {year} for: {batch_id}')
    outputs = get_output_paths(batch_id, year)

    # CHECK: if `success_file` exists: return
    if os.path.isfile(outputs['success_path']): 
        print(f'[INFO] Success file exists: {outputs["success_path"]}')
        return
    # else:
    #     print(f'RERUN:/home/users/astephen/glamod/glamod-ingest/scripts/land/restructure-land.py -r r2.0 -b {batch_id} -y {year}')
    #     return

    if VERBOSE: 
        print(f'[INFO] Reading files:')
        for _ in files:
            print(f'\tINPUT FILE: {_}')
    else:
        print(f'[INFO] Reading input files: {files[0]} , etc.')

    df, _partial_dfs = get_df(files, year)

    # CHECK: lengths of concatenated df equals sum of individual dfs
    l_df = len(df)
    l_partial_dfs = sum([len(_) for _ in _partial_dfs]) 

    if not prep_utils.equal_or_slightly_less(l_df, l_partial_dfs):
        prep_utils.log('failure', outputs, f'Data frame ({l_df}) length and individual frame lengths ({l_partial_dfs}) need checking', DRY_RUN)
        return

    del _partial_dfs

    # Fix column errors
    column_name_mapper = {'data_policy_licence ': 'data_policy_licence',
                          'source_id ': 'source_id'}
    df.rename(columns=column_name_mapper, inplace=True)

    # Make sure the time field is time
    df[time_field] = pd.to_datetime(df[time_field], utc=True) 

    # CHECK: all time fields include a real value
    obs_ids_of_bad_time_fields = df[df[time_field].isnull()]['observation_id'].unique().tolist()

    if len(obs_ids_of_bad_time_fields) > 0:
        prep_utils.log('failure', outputs, f'Some fields had missing value for {time_field}. Observation IDs were: '
                                f'{obs_ids_of_bad_time_fields}', DRY_RUN)
        return

    # Add height column
    fix_land_height(df)
 
    # Modify platform type where it is not defined
    df['platform_type'] = df.apply(lambda x: _set_platform_type(x), axis=1) 

    # Set 'report_type'
    report_type = get_report_type(batch_id)
    df['report_type'] = report_type
    
    # Add the location column
    print(f'[INFO] Adding location column')
    start = time.time()
    prep_utils.add_location_column(df)   
    print(f'[TIMER] {time.time() - start:.1f} secs')

    # Remove any white space from the station name
    # Convert all to strings first

    df['station_name'] = df['station_name'].apply(str)
    df['station_name'] = df['station_name'].str.replace('\s+', ' ', regex=True)

    # Write output file
    if not DRY_RUN:
        print(f'[INFO] Writing output file: {outputs["output_path"]}')
        try:
            df.to_csv(outputs['output_path'], sep='|', index=False, float_format='%.3f', 
                      columns=out_fields, date_format='%Y-%m-%d %H:%M:%S%z')
            prep_utils.log('success', outputs, f'Wrote: {outputs["output_path"]}', DRY_RUN)

            # Remove any previous failure file if exists
            failure_file = outputs['failure_path']
            if os.path.isfile(failure_file):
                os.remove(failure_file)

        except Exception:
            prep_utils.log('failure', outputs, 'Could not write output to PSV file', DRY_RUN)

    else:
        print('[INFO] Not writing output in DRY RUN mode.')


def _read_years_from_gzipped_psv(fpath):

    yd = YEARS_DICT.read()

    if fpath in yd:
        print(f'[INFO] Reading: pickled dict to detect years')
        years = yd[fpath]
    else:
        print(f'[INFO] Reading: {fpath} to detect years')
        df = pd.read_csv(fpath, sep='|', usecols=['date_time'])
        years = sorted(list(set([_.year for _ in pd.to_datetime(df['date_time'], utc=True)])))
        YEARS_DICT.add(fpath, years)

    print(f'[INFO] Found years: {years}')
    return years

def get_year_file_dict(batch_id):

    _batcher = _get_batcher()
    files = _batcher.get(batch_id)

    resp = {}

    for f in files:
        print(f'[INFO] Working on file: {f}')
        years = _read_years_from_gzipped_psv(f) 

        for year in years:
            resp.setdefault(year, [])
            resp[year].append(f) 
     
    return resp    


@click.command()
@click.option('--wait/--no-wait', default=False, help='Short wait (to avoid scheduling problems')
@click.option('-r', '--release', 'release', required=True, help='Release identifier (e.g. "r2.0")')
@click.option('--dry-run/--no-dry-run', default=False, help='Run without writing files (dry run)')
@click.option('-b', '--batch-id', 'batch_id', required=True, help='Batch to process.')
@click.option('-y', '--year', 'year', required=False, type=int,
              help='Year to be processed (useful for identifying failures).')
@click.option('-v', '--verbose', 'verbose', count=True, help='Verbose output.')
def main(wait, release, dry_run, batch_id, year=None, verbose=0):
    # The `wait` argument is used when running in batch mode. Since the process starts
    # by reading the same input file we don't want them all executing at the same time.

    initialise(release)

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
