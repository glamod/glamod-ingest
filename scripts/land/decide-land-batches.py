#!/usr/bin/env python

"""
decide-land-batches.py
======================

Read all header files and sort into sensible batches to process together.

"""

import click
import os

import glamod.settings as gs


COMMON_BASE = None
INPUT_FILES_FILE = None
LAND_BATCH_RULES = None


freqs = [
    'daily',
    'monthly',
    'sub_daily'
]


def initialise(release):
    if release not in gs.RELEASES:
        raise ValueError(f'Release {release} is not valid, must be one of: {gs.RELEASES.keys()}')
    
    global COMMON_BASE
    global INPUT_FILES_FILE
    global LAND_BATCH_RULES

    COMMON_BASE = gs.get(f'{release}:lite:land:incoming:observations')
    INPUT_FILES_FILE = gs.get(f'{release}:lite:land:batches:input_files')
    LAND_BATCH_RULES = gs.get(f'{release}:lite:land:batches:rules')


def get_or_create_input_files_list():
    """Returns a list of all input data files.

    Returns:
        list: list of input files
    """
    print(f'[INFO] Looking up: {INPUT_FILES_FILE}')

    if not os.path.isfile(INPUT_FILES_FILE):
        print('[INFO] Creating input files list from scanning directories...')
        input_files = []

        for freq in freqs:
            dr = os.path.join(COMMON_BASE, freq)
            files = [os.path.join(dr, _) for _ in os.listdir(dr)]
            input_files.extend(files)

        input_files = sorted(list(set(input_files)))

        with open(INPUT_FILES_FILE, 'w') as writer:
            writer.write('\n'.join(input_files))
        
    else:
        input_files = open(INPUT_FILES_FILE).read().strip().split()

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


@click.command()
@click.option('-r', '--release', 'release', required=True, help='Release identifier (e.g. "r2.0")')
def main(release):

    initialise(release)

    input_files = get_or_create_input_files_list()
    write_header()

    for freq in freqs:

        print(f'[INFO] Working on frequency: {freq}')
        dr = os.path.join(COMMON_BASE, freq)
        paths = [_ for _ in input_files if _.startswith(dr)]

        if paths:
            batches = fix_batches(dr, paths)
        else:
            pass



if __name__ == '__main__':

    main()
