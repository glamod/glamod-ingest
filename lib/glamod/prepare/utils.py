#!/usr/bin/env python

"""
utils.py
========

Utility functions for data preparation.

"""

import os, re, glob, sys, time


# Define REGEX for splitting observation id
OB_ID_LAND_REGEX = re.compile(
    r'^(?P<primary_id>.+)-(?P<record_number>\d+)-'
    r'(\d{4})-(\d{2})(-\d{2})?(-\d{2}:\d{2})?-\d+-\d+$')


def _resolve_absolute_dir(dr, base_input_dir):
    """Resolve the directory to its absolute path based on the 
    base directory `base_input_dir`.

    Returns:
        directory path [string]
    """
    if dr.startswith(base_input_dir):
        data_dir = dr
    else:
        data_dir = f'{base_input_dir}/{dr}'

    return data_dir


def log(log_type, outputs, msg='', dry_run=False):

    log_path = outputs[f'{log_type}_path']

    if not dry_run:
        with open(log_path, 'w') as writer:
            writer.write(msg)

    log_level = {'success': 'INFO', 'failure': 'ERROR'}[log_type]
    message = msg or f'Wrote: {log_path}'
    print(f'[{log_level}] {message}') 

    if log_type == 'success':
        print(f'[{log_level}] Wrote success file: {log_path}')


def default_column_to_null(df, column, as_int=False):
    """
    If no value then insert "NULL".
    If `as_int` then convert to int then string.
    """
    series = df[column]

    if as_int:
        df[column] = series[series.notnull()].apply(lambda item: str(int(item)))

    # Using Pandas method to avoid "SettingWithCopyWarning"
    # See: https://www.dataquest.io/blog/settingwithcopywarning/
    # This sets null values to the string 'NULL'
    df.loc[df[column].isnull(), column] = 'NULL'
   

def add_location_column(df):
    """
    Updates DataFrame `df` by adding a `location` string column,
    created from columns: `latitude` and `longitude`.
    """ 
    lon = df['longitude'].tolist()
    lat = df['latitude'].tolist()

    locs = ['SRID=4326;POINT({:.3f} {:.3f})'.format(lon[idx], lat[idx]) for idx in range(len(lat))]

    df['location'] = locs


def equal_or_slightly_less(a, b, threshold=5):
    """
    Return boolean depending on whether `a` is equal to or slightly 
    less than `b` (based on threshold of allowed deviation).

    Args:
        a (number): first number
        b (number): second number
        threshold (int, optional): Threshold. Defaults to 5.

    Returns:
        boolean: boolean denoting the result of the comparison
    """
    if a == b: return True

    if (b - a) < 0 or (b - a) > threshold:
        return False

    print(f'[WARN] Lengths of main DataFrame ({a}) does not equal length of component DataFrames ({b}).')
    return True


def extract_from_observation_id(observation_id, domain='land'):
    if domain != 'land':
        raise NotImplementedError('Not implemented for marine data')

    m = OB_ID_LAND_REGEX.match(observation_id)
    if not m:
        raise ValueError('Could not match expected pattern to observation_id: '
                         f'{observation_id}')

    d = m.groupdict()
    return d['primary_id'], int(d['record_number'])