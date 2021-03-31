#!/usr/bin/env python

import click
import os

import glamod.settings as gs


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

    

@click.command()
@click.option('-r', '--release', 'release', required=True, help='Release identifier (e.g. "r2.0")')
def main(release):

    initialise(release)

    process_files()


