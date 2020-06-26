# CDM-lite work

## Postgis was failing, but fixed with...

ERROR:

```
sudo su postgres
psql cdmlite
cdmlite=# CREATE EXTENSION postgis;
ERROR:  could not load library "/usr/pgsql-9.6/lib/rtpostgis-2.3.so": libhdf5_hl.so.6: cannot open shared object file: No such file or directory
cdmlite=# \q
```

Needed a fix, found at: 

https://gis.stackexchange.com/questions/31177/error-creating-a-spatial-database-error-could-not-load-library-usr-pgsql-9

Fix was:

```
find / -name libhdf5_hl.so.6
$ echo "/usr/lib64/openmpi/lib/" >>  /etc/ld.so.conf.d/postgis-fix.conf
ldconfig
ldconfig -p | grep libhdf5
```

And it linked okay to the library!

```

Tested and then worked:

```
sudo su 
psql cdmlite
cdmlite=# CREATE EXTENSION postgis;
```

## THOUGHTS

 - put files on local server?
 - put files on /work/scratch/astephen/glamod/ ? 
 

## Create database

As user `postgres`:

```
CREATE DATABASE cdmlite;
GRANT ALL ON DATABASE cdmlite TO glamod_dbroot ;
```

## Create schema and set permissions

```
CREATE SCHEMA IF NOT EXISTS $SCHEMA_NAME AUTHORIZATION $SCHEMA_NAME;
GRANT ALL ON SCHEMA $SCHEMA_NAME TO $WEB_USER;
GRANT SELECT ON ALL TABLES IN SCHEMA $SCHEMA_NAME TO $WEB_USER;
```

## Create table


!!!Should we include NOT NULL in these, or is it default?!!!

19 fields, 12 from obs table, 6 from header table, 1 geometry (dynamic).

```
CREATE lite.observations (
    observation_id character varying NOT NULL,     /* from: obs */
    data_policy_licence integer,                   /* from: obs */
    date_time timestamp with time zone,            /* from: obs */
    date_time_meaning integer,                     /* from: obs */
    observation_duration integer,                  /* from: obs */
    longitude numeric,                             /* from: obs */
    latitude numeric,                              /* from: obs */
    report_type integer,                           /* from: header */
    height_of_station_above_sea_level numeric,     /* from: header */
    observed_variable integer,                     /* from: obs */
    units integer,                                 /* from: obs */
    observation_value numeric,                     /* from: obs */
    value_significance integer,                    /* from: obs */
    platform_type integer,                         /* from: header */
    station_type integer,                          /* from: header */
    primary_station_id character varying,          /* from: header */
    station_name character varying,                /* from: header */
    quality_flag integer                           /* from: obs */
    /* location geography - PostGIS field based on: (longitude, latitude) */

);

ALTER TABLE lite.observations ADD COLUMN location geography(Point, 4326);
UPDATE lite.observations SET location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);

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

This looks like a viable approach:

 https://gis.stackexchange.com/questions/145007/creating-geometry-from-lat-lon-in-table-using-postgis
 
 
IS IT `geometry` or `geography`? This source says performance might be 4x quicker if "geometry" is used:

 https://medium.com/coord/postgis-performance-showdown-geometry-vs-geography-ec99967da4f0

```
# Create table and populate, then:
ALTER TABLE lite.observations ADD COLUMN location geography(Point, 4326);   /* or: geometry(Point, 4236) - also works */
UPDATE lite.observations SET location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);
```

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
    height_of_station_above_sea_level numeric,
 
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
height_of_station_above_sea_level in HEADER
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

## # Clustering timings

Total time to cluster: 22 hours for 1.4Tbytes

Estimate rate: 1.5Tb per day
 - should do 10Tb in 1 week!

