#!/usr/bin/env python

"""
make-create-partition-sqls.py
=============================

Writes sql scripts to create partitions.

"""

import sys


schema = sys.argv[1]


SQL = """
CREATE TABLE {schema}.observations (

    observation_id character varying NOT NULL PRIMARY KEY,
    data_policy_licence integer,
    date_time timestamp with time zone,
    date_time_meaning integer,
    observation_duration integer,
    longitude numeric,
    latitude numeric,
    report_type integer,
    height_above_surface numeric,
    observed_variable integer,
    units integer,
    observation_value numeric,
    value_significance integer,
    platform_type integer,
    station_type integer,
    primary_station_id character varying,
    station_name character varying,
    quality_flag integer

);

ALTER TABLE {schema}.observations ADD COLUMN location geography(Point, 4326);
"""


outfile = open('create-table.sql','w')
print(SQL.format(schema=schema), file=outfile)
outfile.close()
