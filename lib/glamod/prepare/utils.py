#!/usr/bin/env python

"""
utils.py
========

Utility functions for data preparation.

"""

import os, re, glob, sys, time

import pandas as pd


def _resolve_absolute_dir(dr, base_input_dir):
    if dr.startswith(base_input_dir):
        data_dir = dr
    else:
        data_dir = f'{base_input_dir}/{dr}'

    return data_dir


def log(log_type, outputs, msg=''):
    log_path = outputs[f'{log_type}_path']
    with open(log_path, 'w') as writer:
        writer.write(msg)

    log_level = {'success': 'INFO', 'failure': 'ERROR'}[log_type]
    message = msg or f'Wrote: {log_path}'
    print(f'[{log_level}] {message}') 


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



