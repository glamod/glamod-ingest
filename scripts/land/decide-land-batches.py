#!/usr/bin/env python

"""
decide-land-batches.py
======================

Read all header files and sort into sensible batches to process together.

"""

import os

import glamod.settings as gs

#BASE_INPUT_DIR = gs.get('r2.0:lite:land:incoming:header_table')
COMMON_BASE = gs.get('r2.0:lite:land:incoming:observations')
#BASE_LOG_DIR = gs.get('r2.0:lite:land:outputs:log')

#COMMON_BASE = '/gws/nopw/j04/c3s311a_lot2/data/level2/land/cdm_lite/'

#r2.0:lite:land  :batches:rules:__GWSD__/level2/land/r202005/batches/cdmlite_batch_rules.txt
input_files_file = gs.get('r2.0:lite:land:batches:input_files')
LAND_BATCH_RULES = gs.get('r2.0:lite:land:batches:rules')


freqs = [
    'daily',
    'monthly',
    'sub_daily'
]

def get_or_create_input_files_list():
    """Returns a list of all input data files.

    Returns:
        list: list of input files
    """
    print(f'[INFO] Looking up: {input_files_file}')

    if not os.path.isfile(input_files_file):
        print('[INFO] Creating input files list from scanning directories...')
        input_files = []

        for freq in freqs:
            dr = os.path.join(COMMON_BASE, freq)
            files = [os.path.join(dr, _) for _ in os.listdir(dr)]
            input_files.extend(files)

        input_files = sorted(list(set(input_files)))

        with open(input_files_file, 'w') as writer:
            writer.write('\n'.join(input_files))
        
    else:
        input_files = open(input_files_file).read().strip().split()

    return input_files

#LAND_BATCH_RULES = '../data/land_cdmlite_batch_rules.txt'

def write_header():
    with open(LAND_BATCH_RULES, 'w') as writer:
        writer.write('path_prefix|batch_id|of_n_batches|batch_length\n')


def fix_batches(path, paths):

    indx = len(path + '/')
    paths = [_[indx:] for _ in paths]

    for n in range(1, 100):
        d = {}
 
        for p in paths:
            key = p[:n]
            d.setdefault(key, [])
            d[key].append(p) 

        mn = min([len(_) for _ in d.values()])
        mx = max([len(_) for _ in d.values()])
 
        if mx > 500: continue
 
        print(f'N: {n}, Number of batches: {len(d)}, sizes: {mn} - {mx}')
        inp = input('Fix? [Y/n] ')

        if inp.strip() == 'Y':
            print(f'[INFO] FIXING: {path}/{key}')
            with open(LAND_BATCH_RULES, 'a') as writer:

                for _, key in enumerate(sorted(d.keys())):
                    freq = path.split('/')[-1]
                    s = f'{path}/{key}*|{freq}-{key}|{len(d)}|{len(d[key])}'
                    writer.write(s + '\n')

            print(f'[INFO] Wrote {_ + 1} records to: {LAND_BATCH_RULES}')
            return


def main():

    input_files = get_or_create_input_files_list()
    write_header()

    for freq in freqs:

        print(f'[INFO] Working on frequency: {freq}')
        dr = os.path.join(COMMON_BASE, freq)
        paths = [_ for _ in input_files if _.startswith(dr)]
        batches = fix_batches(dr, paths) 


if __name__ == '__main__':

    main()
