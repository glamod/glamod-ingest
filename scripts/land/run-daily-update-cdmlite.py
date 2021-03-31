#!/usr/bin/env python

import click
import os
from subprocess import run, PIPE

import glamod.settings as gs

current_dir = os.path.dirname(os.path.realpath(__file__))

BASE_UPDATE_DIR = None
INCOMING_UPDATE_DIR = None
PROCESSING_UPDATE_DIR = None
FAILED_UPDATE_DIR = None
COMPLETE_UPDATE_DIR = None


def initialise(release):

    global BASE_UPDATE_DIR = gs.get(f'{release}:lite:land:incoming:daily_updates')
    global INCOMING_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'incoming')
    global PROCESSING_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'processing')
    global FAILED_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'failed')
    global COMPLETE_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'complete')


def process_files():

    incoming_files = [inc_file for inc_file in os.path.join(INCOMING_UPDATE_DIR, data_file) for data_file in os.listdir(INCOMING_UPDATE_DIR) if os.path.isfile(inc_file)]
    #need to move to processing

    for f in incoming_files:
        restructure_script = os.path.join(current_dir, 'restructure-land.py')
        process = run(['python', restructure_script, '-r', 'r3.0', '-b', f])
        restructure_stdout, restructure_stderr = process.communicate()

        # file is written for each year within the input file.
        # therefore there will be more than one success / failure condition
    

@click.command()
@click.option('-r', '--release', 'release', required=True, help='Release identifier (e.g. "r2.0")')
def main(release):

    initialise(release)

    process_files()


