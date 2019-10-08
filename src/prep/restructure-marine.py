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

Example file names:

 header-1946-01-r092019-000000.psv
 observations-dpt-1947-05-r092019-000000.psv 

Outputs are written to:
 {BASE_OUTPUT_DIR}/<dr>/<year>-<revision>-<other>.psv
 
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
 - CHECK: there are no NULL values for "report_id" 
 - write to `output_file`
 - IF FAILURE: write `failure_file`
 - IF SUCCESS: write `success_file` 

"""

import os, re, glob

import pandas as pd
import click


BASE_INPUT_DIR = '/gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a'
# _EG_SUB_DIR = '001-110'
BASE_OUTPUT_DIR = '/gws/nopw/j04/c3s311a_lot2/data/marine/r092019_cdm_lite/ICOADS_R3.0.0T/level1a'
BASE_LOG_DIR = '/gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/marine'

FILE_PATTN = re.compile('^(observations|header)-?(\w+)?-(?P<year>\d{4})-(\d{2})-(?P<revision>r\d{1,})-(?P<other>\d{1,})\.psv')

hfields = ['report_type', 'platform_type', 'station_type',  'primary_station_id', 'station_name',
           'height_of_station_above_sea_level']

ofields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'observed_variable', 'units', 
'observation_value', 'value_significance', 'quality_flag']

merge_fields = ['report_id']
time_field = 'date_time'

fields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'report_type', 
'height_of_station_above_sea_level', 'observed_variable', 'units', 'observation_value', 
'value_significance', 'platform_type', 'station_type', 'primary_station_id', 'station_name', 
'quality_flag']

year_range = (1946, 2019)


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
    # CHECK: lengths of concatenated df equals sum of individual dfs
    if len(head) != sum([len(_) for _ in _head_dfs]):
        log('failure', outputs, f'Header data frame does not match length of individual frames')
        return

    print(f'[INFO] Reading obs files: {observers[0]} , etc.')
    obs, _obs_dfs = get_df(observers, 'obs')
    # CHECK: lengths of concatenated df equals sum of individual dfs
    if len(obs) != sum([len(_) for _ in _obs_dfs]):
        log('failure', outputs, f'Observation data frame does not match length of individual frames')
        return

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

    # Write output file
    print(f'[INFO] Writing output file: {outputs["output_path"]}')
    try:
        merged.to_csv(outputs['output_path'], sep='|', index=False, date_format='%Y-%m-%d %H:%M:%S%z')
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
@click.option('-d', '--directory', 'dr', required=True, help='Directory to scan.')
@click.argument('years', nargs=-1, callback=_validate_years)
def main(dr, years):

    # Convert `dr` back to single directory name, to work with other code
    dr = os.path.basename(dr)

    for year in years:
        process_year(dr, year)


if __name__ == '__main__':

    main()
