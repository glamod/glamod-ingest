#!/usr/bin/env python

"""
restructure-marine.py
=====================

Restructures marine data for the cdm-lite. 

Requires a JOIN between the Header table and the Observations table.

Join on fields: 
 - report_id

Options:
 - inner: only keep rows where joining fields match in both
 - outer: keep all rows in both tables and fill non-matching entries with NULL
 - left:  keep all the records in the first table, discard the second table records if no match
 - right: keep all the records in the second table, discard the first table records if no match

Function
--------

Data is found in: BASE_INPUT_DIR
It follows a structure: 

 {BASE_INPUT_DIR}/<dr>/{observations-*,header}-<year>-<month>-<revision>-<other>.psv

E.g.:

 /group_workspaces/jasmin2/glamod_marine/data/r092019/ICOADS_R3.0.0T/level2/001-110/header-1950-01-r092019-000000.psv
 /group_workspaces/jasmin2/glamod_marine/data/r092019/ICOADS_R3.0.0T/level2/001-110/observations-at-1950-01-r092019-000000.psv

Example file names:

 header-1946-01-r092019-000000.psv
 observations-dpt-1947-05-r092019-000000.psv 

Outputs are written to:
 {BASE_OUTPUT_DIR}/<dr>/<year>-<revision>-<other>.psv

E.g.:

 
 
Sucess/Failure is indicated by file existence:
 {BASE_LOG_DIR}/success/<dr>/<year>-<revision>-<other>.psv
 {BASE_LOG_DIR}/failure/<dr>/<year>-<revision>-<other>.psv

For each <year> in <years>:
 For a given <dr>, <year>:
 - derive output and log file paths
 - CHECK: if `success_file` exists: exit 
 - read and concatenate headers [n_h=1..12]
 - CHECK: at least 1 Header file exists
 - read and concatenate observations [x7 n_o=n_h*7]
 - CHECK: at least 1 obs file exists for each header file
 - CHECK: lengths of concatenated df equals sum of individual dfs
 - merge tables:
   - on field: "report_id"
   - keeping all records in: observations 
 - CHECK: length of observations matches length of merged table
 - CHECK: all time fields include a real value
 - CHECK: there are no NULL values for "report_id" 
 - write to `output_file`
 - IF FAILURE: write `failure_file`
 - IF SUCCESS: write `success_file` 

"""

import os, re, glob, sys, time

import pandas as pd
import click


#BASE_INPUT_DIR = '/gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1e'
BASE_INPUT_DIR = '/group_workspaces/jasmin2/glamod_marine/data/r092019/ICOADS_R3.0.0T/level2'
# _EG_SUB_DIR = '001-110'
#BASE_OUTPUT_DIR = '/gws/nopw/j04/c3s311a_lot2/data/cdmlite/r201910/marine'
BASE_OUTPUT_DIR = '/work/scratch-nompiio/astephen/glamod/r202001/cdmlite/marine'
# .../gws/nopw/j04/c3s311a_lot2/data/marine/r092019_cdm_lite/ICOADS_R3.0.0T/level1a'
BASE_LOG_DIR = '/gws/smf/j04/c3s311a_lot2/cdmlite/log/r202001/prep/marine'

FILE_PATTN = re.compile('^(observations|header)-?(\w+)?-(?P<year>\d{4})-(\d{2})-(?P<revision>r\d{1,})-(?P<other>\d{1,})\.psv')

# Note: header field "report_quality" is kept for filtering values of 0 only.
#    The out_fields will exclude it later.
hfields = ['report_type', 'platform_type', 'station_type',  'primary_station_id', 'station_name', 'report_quality']

ofields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'observation_height_above_station_surface',
'observed_variable', 'units', 'observation_value', 'value_significance', 'quality_flag']

merge_fields = ['report_id']
time_field = 'date_time'

out_fields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'report_type', 
'height_above_surface', 'observed_variable', 'units', 'observation_value', 
'value_significance', 'platform_type', 'station_type', 'primary_station_id', 'station_name', 
'quality_flag', 'location']

renamers = {'observation_height_above_station_surface': 'height_above_surface'}

header_files = [os.path.basename(_) for _ in glob.glob(f'{BASE_INPUT_DIR}/*/header-*.psv')]
years = sorted(list(set([int(_.split('-')[1]) for _ in header_files])))
year_range = years[0], years[-1]

# Emptying exclusions - should now all work
#EXCLUDE_DIRS = ['063-714']
EXCLUDE_DIRS = []


def _resolve_absolute_dir(dr):
    if dr.startswith(BASE_INPUT_DIR):
        data_dir = dr
    else:
        data_dir = f'{BASE_INPUT_DIR}/{dr}'

    return data_dir


def get_input_paths(dr, year):

    data_dir = _resolve_absolute_dir(dr)

    if not os.path.isdir(data_dir):
        raise Exception(f'Cannot find directory: {data_dir}')        

    headers = glob.glob(f'{data_dir}/header-{year}-??-*.psv')
    observers = glob.glob(f'{data_dir}/observations-*-{year}-??-*.psv')
    return headers, observers
    
    
def get_df(paths, ftype):
    
    data_frames = [pd.read_csv(f, sep='|') for f in paths]

    if ftype == 'head':
        fields = hfields + merge_fields
    elif ftype == 'obs':
        fields = ofields + merge_fields
        
    droppers = [_ for _ in data_frames[0].columns if _ not in fields]
    data_frames = [_.drop(columns=droppers) for _ in data_frames]
    
    df = pd.concat(data_frames)
    return df, data_frames


def get_output_paths(dr, path):
    fname = os.path.basename(path)
    year_file = '{year}-{revision}-{other}.psv'.format(**FILE_PATTN.match(fname).groupdict())
    year = year_file.split('-')[0]

    success_dir = os.path.join(BASE_LOG_DIR, 'success', dr)
    failure_dir = os.path.join(BASE_LOG_DIR, 'failure', dr)
    output_dir  = os.path.join(BASE_OUTPUT_DIR, year)

    for _ in success_dir, failure_dir, output_dir:
        if not os.path.isdir(_):
            os.makedirs(_)

    d = {'year_file': year_file,
         'output_path': os.path.join(output_dir, f'{dr}-{year_file}'),
         'success_path': os.path.join(success_dir, year_file),
         'failure_path': os.path.join(failure_dir, year_file)
        }

    return d


def log(log_type, outputs, msg=''):
    log_path = outputs[f'{log_type}_path']
    with open(log_path, 'w') as writer:
        writer.write(msg)

    log_level = {'success': 'INFO', 'failure': 'ERROR'}[log_type]
    message = msg or f'Wrote: {log_path}'
    print(f'[{log_level}] {message}') 


def OLD_default_to_null(x, column, dtype=None):
    """
    If no value then insert "NULL".
    If `dtype` function set then use that to convert real values.
    """
    if pd.isnull(x[column]):
        return 'NULL'

    value = x[column]
    if dtype:
        value = dtype(value)

    return value


def default_column_to_null(df, column, as_int=False):
    """
    If no value then insert "NULL".
    If `as_int` then convert to int then string.
    """
    series = df[column]

    if as_int:
        df[column] = series[series.notnull()].apply(lambda item: str(int(item)))

    df[column][df[column].isnull()] = 'NULL'


def add_location_column(df):
    """
    Updates DataFrame `df` by adding a `location` string column,
    created from columns: `latitude` and `longitude`.
    """ 
    lon = df['longitude']
    lat = df['latitude']

    locs = ['SRID=4326;POINT({:.3f} {:.3f})'.format(lon[idx], lat[idx]) for idx in range(len(lat))]

    df['location'] = locs
    #    merged['location'] = merged.apply(lambda x: 'SRID=4326;POINT({:.3f} {:.3f})'.format(x['longitude'], x['latitude']), axis=1)



def process_year(dr, year):
    """
    """
    print(f'[INFO] Working on {year} in: {dr}')
    headers, observers = get_input_paths(dr, year)
    outputs = get_output_paths(dr, headers[0])

    # CHECK: if `success_file` exists: return
    if os.path.isfile(outputs['success_path']): 
        print(f'[INFO] Success file exists: {outputs["success_path"]}')
        return

    # CHECK: at least 1 Header file exists
    if len(headers) < 1:
        log('failure', outputs, f'No Header files found for {dr} AND {year}')
        return

    # CHECK: at least 1 obs file exists for each header file
    if len(observers) < 1:
        log('failure', outputs, f'No Obs files found for {dr} AND {year}')
        return
   
    print(f'[INFO] Reading header files: {headers[0]} , etc.')
    head, _head_dfs = get_df(headers, 'head')
    head_length = len(head)

    # CHECK: lengths of concatenated df equals sum of individual dfs
    if len(head) != sum([len(_) for _ in _head_dfs]):
        log('failure', outputs, f'Header data frame does not match length of individual frames')
        return

    del _head_dfs

    print(f'[INFO] Exclude records where `report_quality` is NOT 0.')
    head = head[head['report_quality'] == 0]
    head_length_filtered = len(head)
    
    # These are not errors but we log them as WARNINGS
    if head_length != head_length_filtered:
        n_diff = head_length - head_length_filtered
        print(f'[WARN] Found {n_diff} records where `report_quality` was NOT 0.')

    print(f'[INFO] Reading obs files: {observers[0]} , etc.')
    obs, _obs_dfs = get_df(observers, 'obs')
    # CHECK: lengths of concatenated df equals sum of individual dfs
    if len(obs) != sum([len(_) for _ in _obs_dfs]):
        log('failure', outputs, f'Observation data frame does not match length of individual frames')
        return

    del _obs_dfs

    print('[INFO] Merging files')
    # Merge header and observations tables, retaining all obs records
    merged = obs.merge(head, on=merge_fields, how='left')

    # CHECK: length of observations matches length of merged table
    if (len(obs) != len(merged)):
        log('failure', outputs, 'Lengths of obs and merged are different')
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

    # Rename columns
    merged.rename(columns=renamers, inplace=True)

    # How many records?
    print(f'[INFO] The size of the merged table is: {len(merged)}')
  
    # Set default report_type to 0 for marine
    print('[INFO] Setting `report_type` to zero')
    merged.loc[:, 'report_type'] = 0

    # Fill NULLs in output for fields that might be null in input
    for column in ['height_above_surface', 'primary_station_id', 'station_name']:
        print(f'[INFO] Filling "{column}" with NULLs if not defined.')
        start = time.time()
        x = merged[column]
        default_column_to_null(merged, column) 
#        merged[column] = merged.apply(lambda x: _default_to_null(x, column), axis=1)
        print(f'[TIMER] {time.time() - start:.1f} secs')

    # Fill NULLS in output and convert to integers for some fields
    for column in ['platform_type', 'station_type']:
        print(f'[INFO] Filling "{column}" as INTs if not NULL.')
#        merged[column] = merged.apply(lambda x: _default_to_null(x, column, dtype=int), axis=1)
        start = time.time()
        default_column_to_null(merged, column, as_int=True)
        print(f'[TIMER] {time.time() - start:.1f} secs')

    # Add the location column
    print(f'[INFO] Adding location column')
    start = time.time()
    add_location_column(merged)   
#    merged['location'] = merged.apply(lambda x: 'SRID=4326;POINT({:.3f} {:.3f})'.format(x['longitude'], x['latitude']), axis=1)
    print(f'[TIMER] {time.time() - start:.1f} secs')
#    merged = merged.assign(location=location)

    # Write output file
    print(f'[INFO] Writing output file: {outputs["output_path"]}')
    try:
        merged.to_csv(outputs['output_path'], sep='|', index=False, float_format='%.3f', 
                      columns=out_fields, date_format='%Y-%m-%d %H:%M:%S%z')
        log('success', outputs, msg=f'Wrote: {outputs["output_path"]}')
    except Exception as err:
        log('failure', outputs, 'Could not write output to PSV file')


def _fix_years(years):
    return sorted(list(set([int(y) for y in years])))


def _validate_years(ctx, years):

    if len(years) < 1:
        # Populate from directory
        if 'dr' not in ctx.params:
            raise ValueError('Cannot work out years without "directory" argument.')

        abs_dir = _resolve_absolute_dir(ctx.params["dr"])
        headers = glob.glob(f'{abs_dir}/header-*-??-*.psv')
        years = sorted(list(set([os.path.basename(header).split('-')[1] for header in headers])))
        years = [int(_) for _ in years]

        if len(years) < 1:
            raise Exception(f'Cannot find any header data in directory: {ctx.params["dr"]}')

    if len(years) < 1:
        raise ValueError('Must provide at least one year as argument.')

    err_msg = 'Years must be in range: {}-{}'.format(*year_range)
    
    try:
        years = _fix_years(years)
    except Exception as err:
        raise ValueError(err_msg)

    if years[0] < year_range[0] or years[-1] > year_range[-1]:
        raise ValueError(err_msg)

    return years


@click.command()
@click.option('--wait/--no-wait', default=False)
@click.option('-d', '--directory', 'dr', required=True, help='Directory to scan.')
@click.argument('years', nargs=-1, callback=_validate_years)
def main(wait, dr, years):
    # The `wait` argument is used when running in batch mode. Since the process starts
    # by reading the same headers file we don't want them all executing at the same time.

    # Convert `dr` back to single directory name, to work with other code
    dr = os.path.basename(dr)
    if dr in EXCLUDE_DIRS:
        print(f'[WARN] Directory is in the EXCLUSION LIST: {dr}')
        sys.exit()

    for year in years:
        process_year(dr, year)


if __name__ == '__main__':

    main()
