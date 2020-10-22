"""
settings.py
===========

Holds global settings for GLAMOD ingest.

Dictionary levels:
 - release: r1.0, r2.0
 - profile: full, lite
 - domain: land, marine
 - stage: incoming, level2
 - table: source_configuration, header_table

"""

import os
join = os.path.join

d = {}


RELEASES = {
    'r0.1': 'initial',
    'r0.2': 'beta',
    'r1.0': 'first',
    'r2.0': 'second'
}

DEFAULTS = None
SETTINGS = None

GWSD = '/gws/nopw/j04/c3s311a_lot2/data'
GWSM = '/group_workspaces/jasmin2/glamod_marine'
GWSS = '/gws/smf/j04/c3s311a_lot2'

DATA_BLOCK = """
r2.0:full:land  :incoming:source_configuration:__GWSD__/level2/land/r202005/source_configuration
r2.0:full:land  :incoming:station_configuration:__GWSD__/level2/land/r202005/station_configuration
r2.0:full:land  :incoming:header_table:__GWSD__/level2/land/r202005/header_tables
r2.0:full:land  :incoming:observations_table:__GWSD__/level2/land/r202005/observations_tables
r2.0:full:land  :incoming:daily_updates:__GWSD__/level2/land/r202005/daily_updates
r2.0:lite:land  :incoming:observations:__GWSD__/level2/land/r202005/cdm_lite
r2.0:lite:land  :batches:rules:__GWSD__/level2/land/r202005/batches/cdmlite_batch_rules.txt
r2.0:lite:land  :batches:input_files:__GWSD__/level2/land/r202005/batches/cdmlite_input_files.txt
r2.0:lite:land  :outputs:workflow:/work/scratch-nopw/__USER__/glamod/r2.0/cdmlite/prepare/land
r2.0:lite:land  :outputs:lotus:__GWSS__/workflow/r2.0/lite/land/outputs/lotus
r2.0:lite:land  :outputs:log:__GWSS__/workflow/r2.0/lite/land/outputs/log
r2.0:lite:land  :sql:outputs:__GWSS__/workflow/r2.0/lite/land/sql/outputs
r2.0:lite:land  :sql:lotus:__GWSS__/workflow/r2.0/lite/land/sql/lotus

r1.0:full:land  :incoming:source_configuration:__GWSD__/level2/land/r202001/source_configuration
r1.0:full:land  :incoming:station_configuration:__GWSD__/level2/land/r202001/station_configuration
r1.0:full:land  :incoming:header_table:__GWSD__/level2/land/r202001/header_tables
r1.0:full:land  :incoming:observations_table:__GWSD__/level2/land/r202001/observations_tables
r1.0:full:land  :incoming:daily_updates:__GWSD__/level2/land/r202001/daily_updates
r1.0:lite:land  :incoming:observations:__GWSD__/level2/land/r202001/observations

r0.2:full:land  :incoming::__GWSD__/level2/land/r201901
r0.1:full:land  :incoming::__GWSD__/level2/land/r201712

r2.0:full:marine:incoming:source_configuration:__GWSM__/data/user_manual/v4/level2/configuration_tables/source.psv
r2.0:full:marine:incoming:station_configuration:__GWSM__/data/user_manual/v4/level2/configuration_tables/station_configuration.psv
r2.0:full:marine:incoming:sensor_configuration:__GWSM__/data/user_manual/v4/level2/configuration_tables/sensor_configuration.psv
r2.0:full:marine:incoming:header_table:__GWSM__/data/user_manual/v4/level2
r2.0:full:marine:incoming:observations_table:__GWSM__/data/user_manual/v4/level2

r2.0:lite:marine:incoming:header_table:__GWSM__/data/user_manual/v4/level2
r2.0:lite:marine:outputs :lotus:__GWSS__/workflow/r2.0/lite/marine/outputs/lotus
r2.0:lite:marine:outputs :log:__GWSS__/workflow/r2.0/lite/marine/outputs/log
r2.0:lite:marine:outputs :workflow:/work/scratch-nopw/__USER__/glamod/r2.0/cdmlite/prepare/marine
r2.0:lite:marine:outputs :sql:/gws/nopw/j04/c3s311a_lot2/data-test/ingest/marine/sql/


r1.0:full:marine:incoming:header_table:__GWSM__/data/r092019/ICOADS_R3.0.0T/level2
r1.0:full:marine:incoming:observations_table:__GWSM__/data/r092019/ICOADS_R3.0.0T/level2
r1.0:full:marine:incoming:source_configuration:__GWSM__/data/r092019/ICOADS_R3.0.0T/level2/configuration
r1.0:full:marine:incoming:station_configuration:__GWSM__/data/r092019/ICOADS_R3.0.0T/level2/configuration

""".split('\n')


def get_settings():
    """
    Returns whole setting dictionary. This is a function
    so that it only needs to be called once.

    :return: settings dictionary
    """
    global SETTINGS
    USER = os.environ['USER']

    if not SETTINGS:

        # release : profile : domain : stage : table : path
        SETTINGS = {}

        for line in DATA_BLOCK:

            line = line.strip()
            if not line: continue

            release, profile, domain, stage, table, path = [_.strip() for _ in line.split(':')]

            SETTINGS.setdefault(release, {})
            SETTINGS[release].setdefault(profile, {})
            SETTINGS[release][profile].setdefault(domain, {})
            SETTINGS[release][profile][domain].setdefault(stage, {})
            SETTINGS[release][profile][domain][stage].setdefault(table, {}) 


            SETTINGS[release][profile][domain][stage][table] = \
               path.replace('__GWSD__', GWSD).replace('__GWSM__', GWSM) \
               .replace('__GWSS__', GWSS).replace('__USER__', USER)
            
 
#        SETTINGS = { 'r2.0': { 'full': { 'land': { 'incoming': { 'source_configuration': join(DATA, 'level2/land/r202005/source_configuration.psv'), 'station_configuration': '' } } } } }

    return SETTINGS


def get_defaults():
    """
    Returns a list of default values for each setting.
    Defaults are provided for:
      release : profile : domain : stage : table

    :return: list of default values
    """
    global DEFAULTS

    if not DEFAULTS:
        DEFAULTS = [
            sorted(RELEASES)[-1],
            'full',
            None,
            'incoming',
            None
        ]

    return DEFAULTS


# Functions for getting settings
def get_default(depth):
    """
    Return default value for `depth` of settings dictionary.
    E.g. default "profile" is "full", from DEFAULTS.

    :param depth: depth of settings dictionary [Int]
    :return: default value for setting.
    """
    return get_defaults()[depth]


def get(setting):
    """
    Takes `setting` string, splits on ":" and then returns the appropriate
    setting (or group of settings).

    Settings dict has the following layers:
      release : profile : domain : stage : table

    :param setting: colon-separated setting as string
    :return: setting value
    """
    current = get_settings()

    for i, lookup in enumerate(setting.split(':')):
        if not lookup:
            lookup = get_default(i)

        current = current[lookup]

    return current


def test():
    assert(get('r2.0:full:land:incoming:source_configuration') == \
           '/gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/source_configuration')
    assert(get('r2.0:full:land:incoming:source_configuration') == \
           get(':full:land::source_configuration'))
    print('[INFO] Tests all ran!')


if __name__ == '__main__':

    test()



