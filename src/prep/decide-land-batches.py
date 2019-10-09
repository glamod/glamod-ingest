#!/usr/bin/env python

"""
decide-land-batches.py
======================

Read all header files and sort into sensible batches to process together.

"""

import os

COMMON_BASE = '/gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/'
HEADER_FILES = [_.replace(COMMON_BASE, '') for _ in open('../data/header_files.txt').read().strip().split()]

LAND_BATCH_RULES = '../data/land_batch_rules.txt'

base_dirs = [
    'daily/T1',
    'daily/T3_protect',
    'monthly',
    'sub_daily/AFWA_protect',
    'sub_daily/ICAO_protect',
    'sub_daily/WMO_protect'
]


def fix_batches(dr, paths):

    indx = len(dr + '/')
    paths = [_[indx:] for _ in paths]

    with open(LAND_BATCH_RULES, 'w') as writer:
        writer.write('path_prefix|batch_id|of_n_batches|batch_length\n')

    for n in range(1, 100):
        d = {}
 
        for p in paths:
            key = p[:n]
            d.setdefault(key, [])
            d[key].append(p) 

        mn = min([len(_) for _ in d.values()])
        mx = max([len(_) for _ in d.values()])
 
        if mx > 5000: continue
 
        print(f'N: {n}, Number of batches: {len(d)}, sizes: {mn} - {mx}')
        inp = input('Fix? ')

        if inp.strip() != '':
            print(f'[INFO] FIXING: {dr}/{key}')
            with open(LAND_BATCH_RULES, 'a') as writer:

                for key in sorted(d.keys()):
                    s = f'{dr}/{key}* :: {dr.replace("/", "-")}-{key} :: of {len(d)} :: {len(d[key])}'
                    print(s)
                    writer.write(s + '\n')

            return


def main():

    for dr in base_dirs:

        paths = [_ for _ in HEADER_FILES if _.startswith(dr)]   
        batches = fix_batches(dr, paths) 


if __name__ == '__main__':

    main()
