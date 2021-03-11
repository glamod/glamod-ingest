#!/usr/bin/env python

import os
import sys

import glamod.settings as gs


args = sys.argv[1:]
if not args:
    raise Exception('Must provide a release as the only argument!')

release = args[0]
years_dict_path = gs.get(f'{args[0]}:lite:land:batches:years')
lock_path = f'{years_dict_path}.lock'

if os.path.exists(lock_path):
  os.remove(lock_path)
  print(f'[INFO] Removed {lock_path}')
else:
  print(f'[INFO] No lock file found at {lock_path}')
