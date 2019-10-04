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
 - read and concatenate headers [x12]
 - CHECK: 12 files exist
 - read and concatenate observations [x7 x12=x84]
 - CHECK: 84 files exist
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

hfields = ['report_type', 'platform_type', 'station_type',  'primary_station_id', 'station_name']

ofields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'observation_height_above_station_surface', 
'observed_variable', 'units', 'observation_value', 'value_significance', 'quality_flag']

merge_fields = ['report_id']

fields = ['observation_id', 'data_policy_licence', 'date_time', 'date_time_meaning', 
'observation_duration', 'longitude', 'latitude', 'report_type', 
'observation_height_above_station_surface', 'observed_variable', 'units', 'observation_value', 
'value_significance', 'platform_type', 'station_type', 'primary_station_id', 'station_name', 
'quality_flag']

year_range = (1946, 2019)


def get_input_paths(dr, year):
    headers = glob.glob(f'{dr}/header-{year}-??-*.psv')
    observers = glob.glob(f'{dr}/observations-*-{year}-??-*.psv')
    return headers, observers
    
    
def get_df(paths, ftype):
    
    data_frames = [pd.read_csv(f, sep='|') for f in paths]

    """
Sucess/Failure is indicated by file existence:
 {BASE_LOG_DIR}/success/<dr>/<year>-<revision>-<other>.psv
 {BASE_LOG_DIR}/failure/<dr>/<year>-<revision>-<other>.psv

For a given <dr>, <year>:
 - derive output and log file paths
 - CHECK: if `success_file` exists: exit
 - read and concatenate headers [x12]
 - CHECK: 12 files exist
 - read and concatenate observations [x7 x12=x84]
 - CHECK: 84 files exist
 - CHECK: lengths of concatenated df equals sum of individual dfs
 - merge tables:
   - on field: "report_id"
   - keeping all records in: observations
 - CHECK: there are no NULL values for "report_id"
 - write to `output_file`
 - IF FAILURE: write `failure_file`
 - IF SUCCESS: write `success_file`
    """
    
    
    if ftype == 'head':
        fields = hfields + merge_fields
    elif ftype == 'obs':
        fields = ofields + merge_fields
        
    droppers = [_ for _ in data_frames[0].columns if _ not in fields]
    data_frames = [_.drop(columns=droppers) for _ in data_frames]
    
    df = pd.concat(data_frames)
    # 
    assert (len(df) == sum([len(_) for _ in data_frames]))
    return df


def get_output_paths(dr, path):
    year_file = '{year}-{revision}-{other}.psv'.format(**FILE_PATTN.match(path).groupdict())
    success_dir = os.path.join(BASE_LOG_DIR, 'success', dr)
    failure_dir = os.path.join(BASE_LOG_DIR, 'failure', dr)
    output_dir  = os.path.join(BASE_OUTPUT_DIR, dr)

    for _ in success_dir, failure_dir, output_dir:
        os.makedirs(_)

    d = {'year_file': year_file
         'output_path': os.path.join(output_dir, year_file)
         'success_path': os.path.join(success_dir, year_file)
         'failure_path': os.path.join(failure_dir, year_file)
        }

    return d


def log(log_type, outputs, msg='')
    log_path = outputs[f'{log_type}_path']
    with open(log_path, 'w') as writer:
        writer.write(msg)


def process_year(dr, year):
    """
 - CHECK: there are no NULL values for "report_id"
 - write to `output_file`
 - IF FAILURE: write `failure_file`
 - IF SUCCESS: write `success_file`
"""

    headers, observers = get_input_paths(dr, year)
    outputs = get_output_paths(headers[0])

    # CHECK: if `success_file` exists: return
    if os.path.isfile(outputs['success_path']): 
        return

    # CHECK: 12 files exist
    if len(headers) != 12:
        log('failure', outputs, f'12 Header files not found for {year}')
        return

    # CHECK: 84 files exist
    if len(observers) != 84:
        log('failure', outputs, f'84 Obs files not found for {year}')
        return
   
    head = get_df(headers, 'head')
    obs = get_df(observers, 'obs')

    merged = obs.merge(head, on=merge_fields, how='left')

    # CHECK: length of observations matches length of merged table
    if (len(obs) != len(merged)):
        log('failure', outputs, 'Lengths of obs and merged are different')
        return
 
    # CHECK: there are no NULL values for "report_id" 

    merged = merged.drop(columns=merge_fields)



def _fix_years(years):
    return sorted(list(set([int(y) for y in years])))


def _validate_years(ctx, years):
    if len(years) < 1:
        raise ValueError('Must provide at least one year as argument.')

    err_msg = 'Years must be in range: {}-{}'.format(*year_range)
    try:
        _fix_years(years)
    except Exception as err:
        raise ValueError(err_msg)

    if years[0] < year_range[0] or years[-1] > year_range[-1]:
        raise ValueError(err_msg)


@click.command()
@click.option('-d', '--directory', 'dr', required=True, help='Directory to scan.')
@click.argument('years', nargs=-1, callback=_validate_years)
def main(dr, years):

    years = _fix_years(years)

    for year in years:
 
        process_year(dr, year)


if __name__ == '__main__':

    main()
