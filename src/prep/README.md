# Preparing the cdm-lite data files

## Marine preparation

The marine data is being processed into the following structure:

 - Input directories [~217]:
   `/gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a/???-???`
 - Number of files per directory:
   - Header:          ~90 
   - Observations:   ~630 
 - Number of files in total:
   - Header:        19,494
   - Observations: 136,458

 - Output directories [one per data year]:
   ``

## Land preparation

The land data is processed in the following structures:

### Input data

See script: `./count-land-input-files.sh`

```
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/daily
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/daily/T1
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/daily/T3_protect
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/monthly
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/sub_daily
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/sub_daily/AFWA_protect
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/sub_daily/ICAO_protect
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/sub_daily/WMO_protect
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/daily
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/daily/T1
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/daily/T3_protect
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/monthly
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/sub_daily
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/sub_daily/AFWA_protect
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/sub_daily/ICAO_protect
Searching: /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/sub_daily/WMO_protect
```

Equivalent file counts:

```
$ more l-headers.txt
235017
97530
28
97502
72335
65152
1459
46910
16783

$ more l-obs.txt
235017
97530
28
97502
72335
65152
1459
46910
16783
```

 - There are the same number of header and observations files.
 - Look at the lengths for some example files:
(venv) $ wc -l /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/daily/T3_protect/header_table_BETA_ACW00011604_1.psv
227 /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/daily/T3_protect/header_table_BETA_ACW00011604_1.psv

(venv) $ wc -l /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/daily/T3_protect/observation_table_BETA_ACW00011604_1.psv
1102 /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/daily/T3_protect/observation_table_BETA_ACW00011604_1.psv

### How to process the daily data

Need to batch all input data into:
  - $BASEDIR/cdmlite/land/<report_type>/<yyyy>/<mm>/<report_type>-<yyyy>-<mm>-<input-code>.psv

Maybe then batch them again into BIG files:
 -  $BASEDIR/cdmlite/land/<report_type>/batches/<yyyy>/<mm>/<report_type>-<yyyy>-<mm>.psv


