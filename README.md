# glamod-cdm-lite

Simplified DB for GLAMOD

## The CDM-lite

The CDM-lite is a much cut-down version of the GLAMOD common data model (CDM):

 https://github.com/glamod/common_data_model

It includes a small subset of the fields to reduce the size, and therefore
improve performance.

## Database structure

The CDM-lite has the following 19 fields, derived from the CDM tables as shown here:

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
    height_above_surface,                          /* from: observation (marine) OR mapped from observed_variable (land) */
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
/* UPDATE lite.observations SET location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326); */

```

The last field, `location` is a spatial field generated from the `latitude` and
`longitude` fields.

## Setting up JASMIN environment

```
module load jaspy
cd <DIR>
python -m venv venv --system-site-packages
```

Activate venv:

```
source venv/bin/activate
```
