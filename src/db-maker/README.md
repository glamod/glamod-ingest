# CDM-lite work

## THOUGHTS

 - put files on local server?
 - put files on /work/scratch/astephen/glamod/ ? 

## Create schema and set permissions

```
CREATE SCHEMA IF NOT EXISTS cdmlite AUTHORIZATION $SCHEMA_NAME;
GRANT ALL ON SCHEMA $SCHEMA_NAME TO $WEB_USER;
GRANT SELECT ON ALL TABLES IN SCHEMA $SCHEMA_NAME TO $WEB_USER;
```

## Create table

19 fields, 13 from obs table, 5 from header table, 1 geometry (dynamic).

```
CREATE TABLE $SCHEMA_NAME.observations (
    observation_id character varying NOT NULL,
    data_policy_licence integer,
    date_time timestamp with time zone,
    date_time_meaning integer,
    observation_duration integer,
    longitude numeric,
    latitude numeric,
    report_type integer,
    observation_height_above_station_surface numeric,
    observed_variable integer,
    units integer,
    observation_value numeric,
    value_significance integer,
    platform_type integer,
    station_type integer,
    primary_station_id character varying,
    station_name character varying,
    quality_flag integer,
    location public.geography
);
```

NOTE: all fields are derived from the CDM `observations_table` except:

 - the following, which are derived from the `header_table`.
   - report_type integer
   - platform_type integer
   - station_type integer
   - primary_station_id character varying
   - station_name character varying

 - the `location` field is derived from the fields:
   - longitude numeric
   - latitude numeric
   
## Creating the location spatial field

??? Do this later!!!

## Creating the partitions and triggers

Partition by: 
 - land/marine
 - year
 - report_type
 
??? Do this later!!!

## Loading the marine data

Example files:

 /gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a/001-110/header-1947-04-r092019-000000.psv
 /gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a/001-110/observations-wbt-1947-04-r092019-000000.psv

From the observations table:

    observation_id character varying NOT NULL,
    data_policy_licence integer,
    date_time timestamp with time zone,
    date_time_meaning integer,
    observation_duration integer,
    longitude numeric,
    latitude numeric,
    observation_height_above_station_surface numeric,
    observed_variable integer,
    units integer,
    observation_value numeric,
    value_significance integer,
    quality_flag integer,

From the header table:

    report_type integer,
    platform_type integer,
    station_type integer,
    primary_station_id character varying,
    station_name character varying,
 
# Loading the land data

Example files:

 /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/header_table/daily/T3_protect/header_table_BETA_ARM00087148_1.psv
 /gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta/observations_table/daily/T3_protect/observation_table_BETA_ARM00087148_1.psv

Locally:

 header_table_BETA_ARM00087148_1.psv
 observation_table_BETA_ARM00087148_1.psv
 
Fields required from header table [2]:

```
$ while read FIELD ; do f=$(echo $FIELD | cut -d' ' -f1);  if [ $(head -1 header_table_BETA_ARM00087148_1.psv | grep $f) ]; then echo $f in HEADER ; fi ;  done < fields.txt
report_type in HEADER
primary_station_id in HEADER
```

Fields required from the observations_table [13]:

```
$ while read FIELD ; do f=$(echo $FIELD | cut -d' ' -f1);  if [ $(head -1 observation_table_BETA_ARM00087148_1.psv | grep $f) ]; then echo $f in OBS ; fi ;  done < fields.txt

observation_id in OBS
data_policy_licence in OBS
date_time in OBS
date_time_meaning in OBS
observation_duration in OBS
longitude in OBS
latitude in OBS
observation_height_above_station_surface in OBS
observed_variable in OBS
units in OBS
observation_value in OBS
value_significance in OBS
quality_flag in OBS
```

Fields required from station_configuration table [3]:

```
station_name
station_type
platform_type 
```

## Land logic for constructing cdmlite-ready PSV files

Read 

## Marine logic for constructing cmdlite-ready PSV files

```
$ cd /gws/nopw/j04/c3s311a_lot2/data/marine/r092019/ICOADS_R3.0.0T/level1a/001-110
$ wc -l  *1946-01* | grep -v total
   17711 header-1946-01-r092019-000000.psv
   17691 observations-at-1946-01-r092019-000000.psv    # Air temperature (85)
   17691 observations-dpt-1946-01-r092019-000000.psv   # Dew point temperature (36)
   17387 observations-slp-1946-01-r092019-000000.psv   # Air pressure at sea level (58) slp
   15149 observations-sst-1946-01-r092019-000000.psv   # water temperature  (95) sst
   17691 observations-wbt-1946-01-r092019-000000.psv   # Wet bulb temperature (41) 
   17561 observations-wd-1946-01-r092019-000000.psv    # Wind from direction (106)
   17561 observations-ws-1946-01-r092019-000000.psv    # Wind speed 107)
```

Some counts:

$ wc -l */header-1963*
  2339342 total
$ wc -l */observat*-1963*
  14961011 total
  
Intersection between header table and observation table:

 set(['crs', 'longitude', 'source_id', 'latitude', 'location_method', 'processing_level', 'report_id'])

Workflow:
 - Go through each directory (e.g. "001-110"):
 - For each year:
   - join each header with each observation
    - ON source_id + report_id
   - write the cdm-lite file:
    - cdmlite/<dir>/marine-observations-<year>-<dir>.psv

Transform to PSV:
 - read 

## Management of relationships with Code Tables

A number of the fields are numeric codes that reference "code tables" in the 
CDM. We will make no attempt to decode these in the CDM-lite but the user will
receive a copy of the relevant tables with her data file(s). The bundle of output
files will be returned as a single zip file.

## Structure of the main table

The agreed fields, and their derivations are:

 - Observation ID: observations_table.observation_id
 - Time-step: observations_table.report_type
 - Timestamp: observations_table.date_time
 - Timestamp meaning: observations_table.date_time_meaning
 - Latitude: observations_table.latitude
 - Longitude: observations_table.longitude
 - Height: observations_table.observation_height_above_station_surface
 - Variable code (units are standardised): observations_table.observed_variable
 - Units: observations_table.units
 - Value: observations_table.observation_value
 - Value significance: observations_table.value_significance 
    - value significance defines whether an observed value is max, min, mean, instantaneous, accumulations etc. and is probably needed?
 - Observation duration: observations_table.observation_duration 
 - Platform type: header_table.platform_type
 - Station type: observations_table.station_type
 - Station ID: header_table.primary_station_id
 - Station name: header_table.station_name
 - QC flag: observations_table.quality_flag
 - Data policy: observations_table.data_policy_licence
 - Location: Point Geometry Type, calculated dynamically from: 
   - observations_table.latitude
   - observations_table.longitude
