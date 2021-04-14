#!/usr/bin/env python

import click
import os
import pandas as pd
import smtplib
from sqlalchemy import create_engine
from subprocess import run, PIPE

import glamod.settings as gs
import glamod.utils.pickle_dict as pdict

current_dir = os.path.dirname(os.path.realpath(__file__))

BASE_UPDATE_DIR = None
INCOMING_UPDATE_DIR = None
PROCESSING_UPDATE_DIR = None
FAILED_UPDATE_DIR = None
COMPLETE_UPDATE_DIR = None

RELEASE = None
YEARS_DICT = None

CONNECTION_STRING = None

time_field = 'date_time'
recipients = ['jonathan.haigh@stfc.ac.uk']


def initialise(release):

    if release not in gs.RELEASES:
        raise ValueError(f'Release {release} is not valid, must be one of: {gs.RELEASES.keys()}')

    global BASE_UPDATE_DIR
    global INCOMING_UPDATE_DIR
    global PROCESSING_UPDATE_DIR
    global FAILED_UPDATE_DIR
    global COMPLETE_UPDATE_DIR
    global RELEASE
    global YEARS_DICT
    global CONNECTION_STRING

    RELEASE = release

    BASE_UPDATE_DIR = gs.get(f'{release}:lite:land:incoming:daily_updates')
    INCOMING_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'incoming')
    PROCESSING_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'processing')
    FAILED_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'failed')
    COMPLETE_UPDATE_DIR = os.path.join(BASE_UPDATE_DIR, 'complete')

    years_dict_file = gs.get(f'{release}:lite:land:batches:years')
    YEARS_DICT = pdict.PickleDict(years_dict_file)

    prefix = os.environ.get("PSQL_PREFIX")
    pword = os.environ.get("PGPASSWORD")

    if prefix and pword:
        prefix_split = prefix.split(' ')
        username = prefix_split[2]
        host = prefix_split[4]
        db_name = prefix_split[5]
        CONNECTION_STRING = f'postgresql://{username}:{pword}@{host}:5432/{db_name}'
    else:
        raise ValueError('Please make sure environment variables PSQL_PREFIX and PGPASSWORD are set')
    

def process_files():

    reporter = Reporter(recipients)

    # move files to processing dir
    processing_files = []

    for f in os.listdir(INCOMING_UPDATE_DIR):
        if os.path.isfile(os.path.join(INCOMING_UPDATE_DIR, f)):

            os.rename(os.path.join(INCOMING_UPDATE_DIR, f), 
                      os.path.join(PROCESSING_UPDATE_DIR, f))
            
            processing_files.append(os.path.join(PROCESSING_UPDATE_DIR, f))


    for f_path in processing_files:

        failed = False

        # restructure
        restructure_script = os.path.join(current_dir, 'restructure-land.py')
        result = run(['python', restructure_script, '-r', RELEASE, '-b', f_path])

        if 'failure' in result.stdout:
            reporter.add_report(f_path, 'failure', result.stdout)
            continue
        elif result.returncode != 0:
            reporter.add_report(f_path, 'failure', f'[ERROR] Error restructuring {f_path}: {result.stderr}')
            continue

        # sql
        input_dir = os.path.join(gs.get(f'{release}:lite:land:outputs:workflow'), '3')
        yd = YEARS_DICT.read()
        years = yd[f_path] # very unlikely this will be more than one

        output_dir = os.path.join(gs.get(f'{release}:lite:land:sql:outputs'), '3')

        engine = create_engine(CONNECTION_STRING, echo=False)

        for yr in years:

            f_basename = os.path.basename(f_path).rstrip('.gz').rstrip('.psv')
            input_file_name = f'3-{yr}-daily_update-{f_basename}.psv'
            input_file_path = os.path.join(input_dir, yr, input_file_name)

            df = pd.read_csv(input_file_path, sep='|', parse_dates=[time_field])

            # use r2.0 for testing
            schema = 'lite_' + RELEASE[1:].replace('.', '_')
            table_name = f'{schema}.observations_{yr}_land_3'

            try:
                df.to_sql(table_name, con=engine, if_exists='append', index=False)
            except Exception as e:
                reporter.add_report(f_path, 'failure', f'[ERROR] Error loading sql for {f_path} {yr}: {str(e)}')
                failed = True
                break
        
        if not failed:
            reporter.add_report(f_path, 'success', f'[INFO] {f_path} processed successfully')

    reporter.send_reports()


@click.command()
@click.option('-r', '--release', 'release', required=True, help='Release identifier (e.g. "r2.0")')
def main(release):

    initialise(release)
    process_files()


class Reporter():

    def __init__(self, recipients):

        self.reports = []
        self.recipients = recipients


    def add_report(self, f_path, case, message): # make a class

        print(message)
        self.reports.append((f_path, message))

        if case == 'failure':
            os.rename(f_path, os.path.join(FAILED_UPDATE_DIR, os.path.basename(f_path)))

        elif case == 'success':
            os.rename(f_path, os.path.join(COMPLETE_UPDATE_DIR, os.path.basename(f_path)))


    def send_reports(self):

        from_address = 'no-reply@ceda.ac.uk'
        mailhost = 'exchsmtp.stfc.ac.uk'
        subject = 'GLAMOD Daily Updates Report'

        server = smtplib.SMTP(mailhost)
        server.set_debuglevel(1)

        message = ''

        for f_path, message in self.reports:
            message += f'{f_path}\n{message}\n\n'

        for recipient in self.recipients:
            content = f'To: {recipient}\nFrom: {from_address}\nSubject: {subject}\n\n{message}'

            server.sendmail(from_address, recipient, content)

        server.close()
