import sys

schema = sys.argv[1]

stations = {
    'land':   {'report': [0, 2, 3], 'start': 1752},
    'marine': {'report': [0], 'start': 1851},
}

inv_stations = {
    'land': 1,
    'marine': 2
}

START_YEAR = 1752
END_YEAR = 2022


