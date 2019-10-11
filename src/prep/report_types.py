#!/usr/bin/env python

import sys

if len(sys.argv) > 1:
    arg = sys.argv[1] 
else:
    arg = 'NO ARGUMENT PROVIDED'


report_types = ['sub_daily', 'UNUSED', 'monthly', 'daily']

if arg in report_types:
    print(report_types.index(arg))
elif arg in ['0', '2', '3']:
    print(report_types[int(arg)])
else:
    raise Exception('Could not resolve report type: {0}'.format(arg))
