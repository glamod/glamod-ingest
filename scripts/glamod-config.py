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


def show_help():
    print("""glamod-config.py
================

Takes a config setting and returns the appropriate path.

Usage: 

    glamod-config.py <config-string>

Where:
     config-string:   is colon-separated identifiers representing:
                      release : profile : domain : stage : table

Example:

```
$ glamod-config.py r2.0:full:land:incoming:source_configuration
/gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/source_configuration
```

""")

def main():

    args = sys.argv[1:]
    if len(args) == 0 or args[0].lower() in ('-h', '--h', '-help', '--help', 'help'):
        return show_help()

    settings_string = args[0]
    
    try:
        print(gs.get(settings_string))
    except Exception:
        raise KeyError(f'Setting not found: {settings_string}')


if __name__ == '__main__':

    main()

