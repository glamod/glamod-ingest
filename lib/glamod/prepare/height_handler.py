"""
height_handler.py
=================

Manages height based on these rules:

 * define height as new column: "height_above_surface"

 * For land data:
   - Use the mapping in Simon's table below from "observed_variable".
   - If there are any records with an "observed_variable" not mentioned: set to 2 metres.
   
 * For marine data:
   - use value of "observation.observation_height_above_station_surface"
   - This is done inside: restructure-marine.py
   
"""


import pandas as pd

# Land rules:
# CDM_code	Variable_ name	Observation_height_above_station_surface metres (m)

_land_rules = """
85	Temperature	2
36	Dew point temperature	2
58	Sea Level Pressure	2
57	Surface level Pressure	2
106	Wind Speed	10
107	Wind Direction	10
55	snow water equivalent	1
53	Snow depth	0
45	Fresh Snow	1
44	Precipitation	1
""".strip().split('\n')

land_rules = dict([(int(_.split('\t')[0]), int(_.split('\t')[2])) for _ in _land_rules])


def _get_land_height(var_code):
    return land_rules.get(var_code, 2)


def fix_land_height(df):
    df['height_above_surface'] = df.apply(lambda x: _get_land_height(x['observed_variable']), axis=1)













