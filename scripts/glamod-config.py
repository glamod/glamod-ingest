#!/usr/bin/env python

"""
glamod-config.py
================

Script to query/access glamod configuration info.

"""

import os
import sys

# Work out base directory and add lib to path
BASE_DIR = '/'.join(os.path.abspath(__file__).split('/')[:-2])
sys.path.append(f'{BASE_DIR}/lib')

import glamod.settings as gs


def main():
    settings_string = sys.argv[1]
    
    try:
        print(gs.get(settings_string))
    except Exception as exc:
        raise KeyError(f'Setting not found: {settings_string}')


if __name__ == '__main__':

    main()

