# glamod-cdm-lite

Simplified DB for GLAMOD

## The CDM-lite

The CDM-lite is a much cut-down version of the GLAMOD common data model (CDM):

 https://github.com/glamod/common_data_model

It includes a small subset of the fields to reduce the size, and therefore
improve performance.

## Database structure

The CDM-lite has the following 19 fields, derived from the CDM tables as shown:

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
 - Value significance: observations_table.value_significance - value significance 
      defines whether an observed value is max, min, mean, instantaneous, 
      accumulations etc. and is probably needed?
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

The last field, `location` is a spatial field generated from the `latitude` and
`longitude` fields.
