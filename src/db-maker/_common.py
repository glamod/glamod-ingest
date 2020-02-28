import sys

schema = sys.argv[1]

stations = {
    'land':   {'report': [0, 2, 3], 'start': 1761},
    'marine': {'report': [0], 'start': 1946},
}

inv_stations = {
    'land': 1,
    'marine': 2
}

START_YEAR = 1761
END_YEAR = 2019


