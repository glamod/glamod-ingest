# CDM Structure

## CDM Observations table

Structure:

```
c3s311a=> \d cdm_v1.observations_table;
                        Table "cdm_v1.observations_table"
                  Column                  |           Type           | Modifiers
------------------------------------------+--------------------------+-----------
 observation_id                           | character varying        | not null
 report_id                                | character varying        |
 data_policy_licence                      | integer                  |
 date_time                                | timestamp with time zone |
 date_time_meaning                        | integer                  |
 observation_duration                     | integer                  |
 longitude                                | numeric                  |
 latitude                                 | numeric                  |
 crs                                      | integer                  |
 z_coordinate                             | numeric                  |
 z_coordinate_type                        | integer                  |
 observation_height_above_station_surface | numeric                  |
 observed_variable                        | integer                  |
 secondary_variable                       | integer                  |
 observation_value                        | numeric                  |
 value_significance                       | integer                  |
 secondary_value                          | integer                  |
 units                                    | integer                  |
 code_table                               | integer                  |
 conversion_flag                          | integer                  |
 location_method                          | integer                  |
 location_precision                       | numeric                  |
 z_coordinate_method                      | integer                  |
 bbox_min_longitude                       | numeric                  |
 bbox_max_longitude                       | numeric                  |
 bbox_min_latitude                        | numeric                  |
 bbox_max_latitude                        | numeric                  |
 spatial_representativeness               | integer                  |
 quality_flag                             | integer                  |
 numerical_precision                      | numeric                  |
 sensor_id                                | character varying        |
 sensor_automation_status                 | integer                  |
 exposure_of_sensor                       | integer                  |
 original_precision                       | numeric                  |
 original_units                           | integer                  |
 original_code_table                      | integer                  |
 original_value                           | numeric                  |
 conversion_method                        | integer                  |
 processing_code                          | integer[]                |
 processing_level                         | integer                  |
 adjustment_id                            | character varying        |
 traceability                             | integer                  |
 advanced_qc                              | integer                  |
 advanced_uncertainty                     | integer                  |
 advanced_homogenisation                  | integer                  |
 source_id                                | character varying        |
 report_type                              | integer                  |
 station_type                             | integer                  |
 location                                 | geography                |
Indexes:
    "observations_table_pkey" PRIMARY KEY, btree (observation_id)
Foreign-key constraints:
    "observations_table_adjustment_id_fkey" FOREIGN KEY (adjustment_id) REFERENCES cdm_v1.adjustment(adjustment_id)
    "observations_table_advanced_homogenisation_fkey" FOREIGN KEY (advanced_homogenisation) REFERENCES cdm_v1.data_present(flag)
    "observations_table_advanced_qc_fkey" FOREIGN KEY (advanced_qc) REFERENCES cdm_v1.data_present(flag)
    "observations_table_advanced_uncertainty_fkey" FOREIGN KEY (advanced_uncertainty) REFERENCES cdm_v1.data_present(flag)
    "observations_table_conversion_flag_fkey" FOREIGN KEY (conversion_flag) REFERENCES cdm_v1.conversion_flag(flag)
    "observations_table_conversion_method_fkey" FOREIGN KEY (conversion_method, observed_variable) REFERENCES cdm_v1.conversion_method(method, variable)
    "observations_table_crs_fkey" FOREIGN KEY (crs) REFERENCES cdm_v1.crs(crs)
    "observations_table_data_policy_licence_fkey" FOREIGN KEY (data_policy_licence) REFERENCES cdm_v1.data_policy_licence(policy)
    "observations_table_date_time_meaning_fkey" FOREIGN KEY (date_time_meaning) REFERENCES cdm_v1.meaning_of_time_stamp(meaning)
    "observations_table_exposure_of_sensor_fkey" FOREIGN KEY (exposure_of_sensor) REFERENCES cdm_v1.instrument_exposure_quality(exposure)
    "observations_table_location_method_fkey" FOREIGN KEY (location_method) REFERENCES cdm_v1.location_method(method)
    "observations_table_observation_duration_fkey" FOREIGN KEY (observation_duration) REFERENCES cdm_v1.duration(duration)
    "observations_table_observed_variable_fkey" FOREIGN KEY (observed_variable) REFERENCES cdm_v1.observed_variable(variable)
    "observations_table_original_units_fkey" FOREIGN KEY (original_units) REFERENCES cdm_v1.units(units)
    "observations_table_processing_level_fkey" FOREIGN KEY (processing_level) REFERENCES cdm_v1.processing_level(level)
    "observations_table_quality_flag_fkey" FOREIGN KEY (quality_flag) REFERENCES cdm_v1.quality_flag(flag)
    "observations_table_report_id_fkey" FOREIGN KEY (report_id) REFERENCES cdm_v1.header_table(report_id)
    "observations_table_report_type_fkey" FOREIGN KEY (report_type) REFERENCES cdm_v1.report_type(type)
    "observations_table_secondary_variable_fkey" FOREIGN KEY (secondary_variable, secondary_value) REFERENCES cdm_v1.secondary_variable(variable, value)
    "observations_table_sensor_automation_status_fkey" FOREIGN KEY (sensor_automation_status) REFERENCES cdm_v1.automation_status(automation)
    "observations_table_sensor_id_fkey" FOREIGN KEY (sensor_id) REFERENCES cdm_v1.sensor_configuration(sensor_id)
    "observations_table_source_id_fkey" FOREIGN KEY (source_id) REFERENCES cdm_v1.source_configuration(source_id)
    "observations_table_spatial_representativeness_fkey" FOREIGN KEY (spatial_representativeness) REFERENCES cdm_v1.spatial_representativeness(representativeness)
    "observations_table_station_type_fkey" FOREIGN KEY (station_type) REFERENCES cdm_v1.station_type(type)
    "observations_table_traceability_fkey" FOREIGN KEY (traceability) REFERENCES cdm_v1.traceability(traceability)
    "observations_table_units_fkey" FOREIGN KEY (units) REFERENCES cdm_v1.units(units)
    "observations_table_value_significance_fkey" FOREIGN KEY (value_significance) REFERENCES cdm_v1.observation_value_significance(significance)
    "observations_table_z_coordinate_method_fkey" FOREIGN KEY (z_coordinate_method) REFERENCES cdm_v1.z_coordinate_method(method)
    "observations_table_z_coordinate_type_fkey" FOREIGN KEY (z_coordinate_type) REFERENCES cdm_v1.z_coordinate_type(type)
Referenced by:
    TABLE "cdm_v1.homogenisation_table" CONSTRAINT "homogenisation_table_observation_id_fkey" FOREIGN KEY (observation_id) REFERENCES cdm_v1.observations_table(observation_id)
    TABLE "cdm_v1.qc_table" CONSTRAINT "qc_table_observation_id_fkey" FOREIGN KEY (observation_id) REFERENCES cdm_v1.observations_table(observation_id)
    TABLE "cdm_v1.uncertainty_table" CONSTRAINT "uncertainty_table_observation_id_fkey" FOREIGN KEY (observation_id) REFERENCES cdm_v1.observations_table(observation_id)
Triggers:
    observations_insert_trigger BEFORE INSERT ON cdm_v1.observations_table FOR EACH ROW EXECUTE PROCEDURE cdm_v1.observations_insert_trigger()
    observations_table_insert_check BEFORE INSERT ON cdm_v1.observations_table FOR EACH ROW EXECUTE PROCEDURE cdm_v1.validate_observations_table()
Number of child tables: 1071 (Use \d+ to list them.)
```

Reverse-engineered CREATE:

```
$ pg_dump -U glamod_dbroot -h localhost -t 'cdm_v1.observations_table' --schema-only c3s311a
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 9.6.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: observations_table; Type: TABLE; Schema: cdm_v1; Owner: glamod_dbroot
--

CREATE TABLE cdm_v1.observations_table (
    observation_id character varying NOT NULL,
    report_id character varying,
    data_policy_licence integer,
    date_time timestamp with time zone,
    date_time_meaning integer,
    observation_duration integer,
    longitude numeric,
    latitude numeric,
    crs integer,
    z_coordinate numeric,
    z_coordinate_type integer,
    observation_height_above_station_surface numeric,
    observed_variable integer,
    secondary_variable integer,
    observation_value numeric,
    value_significance integer,
    secondary_value integer,
    units integer,
    code_table integer,
    conversion_flag integer,
    location_method integer,
    location_precision numeric,
    z_coordinate_method integer,
    bbox_min_longitude numeric,
    bbox_max_longitude numeric,
    bbox_min_latitude numeric,
    bbox_max_latitude numeric,
    spatial_representativeness integer,
    quality_flag integer,
    numerical_precision numeric,
    sensor_id character varying,
    sensor_automation_status integer,
    exposure_of_sensor integer,
    original_precision numeric,
    original_units integer,
    original_code_table integer,
    original_value numeric,
    conversion_method integer,
    processing_code integer[],
    processing_level integer,
    adjustment_id character varying,
    traceability integer,
    advanced_qc integer,
    advanced_uncertainty integer,
    advanced_homogenisation integer,
    source_id character varying,
    report_type integer,
    station_type integer,
    location public.geography
);


ALTER TABLE cdm_v1.observations_table OWNER TO glamod_dbroot;

--
-- Name: observations_table observations_table_pkey; Type: CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_pkey PRIMARY KEY (observation_id);


--
-- Name: observations_table observations_insert_trigger; Type: TRIGGER; Schema: cdm_v1; Owner: glamod_dbroot
--

CREATE TRIGGER observations_insert_trigger BEFORE INSERT ON cdm_v1.observations_table FOR EACH ROW EXECUTE PROCEDURE cdm_v1.observations_insert_trigger();


--
-- Name: observations_table observations_table_insert_check; Type: TRIGGER; Schema: cdm_v1; Owner: glamod_dbroot
--

CREATE TRIGGER observations_table_insert_check BEFORE INSERT ON cdm_v1.observations_table FOR EACH ROW EXECUTE PROCEDURE cdm_v1.validate_observations_table();


--
-- Name: observations_table observations_table_adjustment_id_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_adjustment_id_fkey FOREIGN KEY (adjustment_id) REFERENCES cdm_v1.adjustment(adjustment_id);


--
-- Name: observations_table observations_table_advanced_homogenisation_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_advanced_homogenisation_fkey FOREIGN KEY (advanced_homogenisation) REFERENCES cdm_v1.data_present(flag);


--
-- Name: observations_table observations_table_advanced_qc_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_advanced_qc_fkey FOREIGN KEY (advanced_qc) REFERENCES cdm_v1.data_present(flag);


--
-- Name: observations_table observations_table_advanced_uncertainty_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_advanced_uncertainty_fkey FOREIGN KEY (advanced_uncertainty) REFERENCES cdm_v1.data_present(flag);


--
-- Name: observations_table observations_table_conversion_flag_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_conversion_flag_fkey FOREIGN KEY (conversion_flag) REFERENCES cdm_v1.conversion_flag(flag);


--
-- Name: observations_table observations_table_conversion_method_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_conversion_method_fkey FOREIGN KEY (conversion_method, observed_variable) REFERENCES cdm_v1.conversion_method(method, variable);


--
-- Name: observations_table observations_table_crs_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_crs_fkey FOREIGN KEY (crs) REFERENCES cdm_v1.crs(crs);


--
-- Name: observations_table observations_table_data_policy_licence_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_data_policy_licence_fkey FOREIGN KEY (data_policy_licence) REFERENCES cdm_v1.data_policy_licence(policy);


--
-- Name: observations_table observations_table_date_time_meaning_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_date_time_meaning_fkey FOREIGN KEY (date_time_meaning) REFERENCES cdm_v1.meaning_of_time_stamp(meaning);


--
-- Name: observations_table observations_table_exposure_of_sensor_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_exposure_of_sensor_fkey FOREIGN KEY (exposure_of_sensor) REFERENCES cdm_v1.instrument_exposure_quality(exposure);


--
-- Name: observations_table observations_table_location_method_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_location_method_fkey FOREIGN KEY (location_method) REFERENCES cdm_v1.location_method(method);


--
-- Name: observations_table observations_table_observation_duration_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_observation_duration_fkey FOREIGN KEY (observation_duration) REFERENCES cdm_v1.duration(duration);


--
-- Name: observations_table observations_table_observed_variable_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_observed_variable_fkey FOREIGN KEY (observed_variable) REFERENCES cdm_v1.observed_variable(variable);


--
-- Name: observations_table observations_table_original_units_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_original_units_fkey FOREIGN KEY (original_units) REFERENCES cdm_v1.units(units);


--
-- Name: observations_table observations_table_processing_level_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_processing_level_fkey FOREIGN KEY (processing_level) REFERENCES cdm_v1.processing_level(level);


--
-- Name: observations_table observations_table_quality_flag_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_quality_flag_fkey FOREIGN KEY (quality_flag) REFERENCES cdm_v1.quality_flag(flag);


--
-- Name: observations_table observations_table_report_id_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_report_id_fkey FOREIGN KEY (report_id) REFERENCES cdm_v1.header_table(report_id);


--
-- Name: observations_table observations_table_report_type_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_report_type_fkey FOREIGN KEY (report_type) REFERENCES cdm_v1.report_type(type);


--
-- Name: observations_table observations_table_secondary_variable_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_secondary_variable_fkey FOREIGN KEY (secondary_variable, secondary_value) REFERENCES cdm_v1.secondary_variable(variable, value);


--
-- Name: observations_table observations_table_sensor_automation_status_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_sensor_automation_status_fkey FOREIGN KEY (sensor_automation_status) REFERENCES cdm_v1.automation_status(automation);


--
-- Name: observations_table observations_table_sensor_id_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES cdm_v1.sensor_configuration(sensor_id);


--
-- Name: observations_table observations_table_source_id_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_source_id_fkey FOREIGN KEY (source_id) REFERENCES cdm_v1.source_configuration(source_id);


--
-- Name: observations_table observations_table_spatial_representativeness_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_spatial_representativeness_fkey FOREIGN KEY (spatial_representativeness) REFERENCES cdm_v1.spatial_representativeness(representativeness);


--
-- Name: observations_table observations_table_station_type_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_station_type_fkey FOREIGN KEY (station_type) REFERENCES cdm_v1.station_type(type);


--
-- Name: observations_table observations_table_traceability_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_traceability_fkey FOREIGN KEY (traceability) REFERENCES cdm_v1.traceability(traceability);


--
-- Name: observations_table observations_table_units_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_units_fkey FOREIGN KEY (units) REFERENCES cdm_v1.units(units);


--
-- Name: observations_table observations_table_value_significance_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_value_significance_fkey FOREIGN KEY (value_significance) REFERENCES cdm_v1.observation_value_significance(significance);


--
-- Name: observations_table observations_table_z_coordinate_method_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_z_coordinate_method_fkey FOREIGN KEY (z_coordinate_method) REFERENCES cdm_v1.z_coordinate_method(method);


--
-- Name: observations_table observations_table_z_coordinate_type_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.observations_table
    ADD CONSTRAINT observations_table_z_coordinate_type_fkey FOREIGN KEY (z_coordinate_type) REFERENCES cdm_v1.z_coordinate_type(type);


--
-- Name: TABLE observations_table; Type: ACL; Schema: cdm_v1; Owner: glamod_dbroot
--

GRANT SELECT ON TABLE cdm_v1.observations_table TO webuser;


--
-- PostgreSQL database dump complete
--
```

## And for the Header TABLE

```
$ pg_dump -U glamod_dbroot -h localhost -t 'cdm_v1.header_table' --schema-only c3s311a
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 9.6.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: header_table; Type: TABLE; Schema: cdm_v1; Owner: glamod_dbroot
--

CREATE TABLE cdm_v1.header_table (
    report_id character varying NOT NULL,
    region integer,
    sub_region integer,
    application_area integer[],
    observing_programme integer[],
    report_type integer,
    station_name character varying,
    station_type integer,
    platform_type integer,
    platform_sub_type integer,
    primary_station_id character varying,
    station_record_number integer,
    primary_station_id_scheme integer,
    longitude numeric,
    latitude numeric,
    location_accuracy numeric,
    location_method integer,
    location_quality integer,
    crs integer,
    station_speed numeric,
    station_course numeric,
    station_heading numeric,
    height_of_station_above_local_ground numeric,
    height_of_station_above_sea_level numeric,
    height_of_station_above_sea_level_accuracy numeric,
    sea_level_datum integer,
    report_meaning_of_timestamp integer,
    report_timestamp timestamp with time zone,
    report_duration integer,
    report_time_accuracy numeric,
    report_time_quality integer,
    report_time_reference integer,
    profile_id character varying,
    events_at_station integer[],
    report_quality integer,
    duplicate_status integer,
    duplicates character varying[],
    record_timestamp timestamp with time zone,
    history character varying,
    processing_level integer,
    processing_codes integer[],
    source_id character varying,
    source_record_id character varying,
    location public.geography
);


ALTER TABLE cdm_v1.header_table OWNER TO glamod_dbroot;

--
-- Name: header_table header_table_pkey; Type: CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_pkey PRIMARY KEY (report_id);


--
-- Name: header_table header_insert_trigger; Type: TRIGGER; Schema: cdm_v1; Owner: glamod_dbroot
--

CREATE TRIGGER header_insert_trigger BEFORE INSERT ON cdm_v1.header_table FOR EACH ROW EXECUTE PROCEDURE cdm_v1.header_insert_trigger();


--
-- Name: header_table header_table_crs_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_crs_fkey FOREIGN KEY (crs) REFERENCES cdm_v1.crs(crs);


--
-- Name: header_table header_table_duplicate_status_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_duplicate_status_fkey FOREIGN KEY (duplicate_status) REFERENCES cdm_v1.duplicate_status(status);


--
-- Name: header_table header_table_location_method_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_location_method_fkey FOREIGN KEY (location_method) REFERENCES cdm_v1.location_method(method);


--
-- Name: header_table header_table_location_quality_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_location_quality_fkey FOREIGN KEY (location_quality) REFERENCES cdm_v1.location_quality(quality);


--
-- Name: header_table header_table_platform_sub_type_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_platform_sub_type_fkey FOREIGN KEY (platform_sub_type) REFERENCES cdm_v1.platform_sub_type(sub_type);


--
-- Name: header_table header_table_platform_type_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_platform_type_fkey FOREIGN KEY (platform_type) REFERENCES cdm_v1.platform_type(type);


--
-- Name: header_table header_table_primary_station_id_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_primary_station_id_fkey FOREIGN KEY (primary_station_id, station_record_number) REFERENCES cdm_v1.station_configuration(primary_id, record_number);


--
-- Name: header_table header_table_primary_station_id_scheme_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_primary_station_id_scheme_fkey FOREIGN KEY (primary_station_id_scheme) REFERENCES cdm_v1.id_scheme(scheme);


--
-- Name: header_table header_table_processing_level_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_processing_level_fkey FOREIGN KEY (processing_level) REFERENCES cdm_v1.report_processing_level(level);


--
-- Name: header_table header_table_profile_id_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES cdm_v1.profile_configuration(profile_id);


--
-- Name: header_table header_table_region_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_region_fkey FOREIGN KEY (region) REFERENCES cdm_v1.region(region);


--
-- Name: header_table header_table_report_duration_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_report_duration_fkey FOREIGN KEY (report_duration) REFERENCES cdm_v1.duration(duration);


--
-- Name: header_table header_table_report_meaning_of_timestamp_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_report_meaning_of_timestamp_fkey FOREIGN KEY (report_meaning_of_timestamp) REFERENCES cdm_v1.meaning_of_time_stamp(meaning);


--
-- Name: header_table header_table_report_quality_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_report_quality_fkey FOREIGN KEY (report_quality) REFERENCES cdm_v1.quality_flag(flag);


--
-- Name: header_table header_table_report_time_quality_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_report_time_quality_fkey FOREIGN KEY (report_time_quality) REFERENCES cdm_v1.time_quality(quality);


--
-- Name: header_table header_table_report_time_reference_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_report_time_reference_fkey FOREIGN KEY (report_time_reference) REFERENCES cdm_v1.time_reference(reference);


--
-- Name: header_table header_table_report_type_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_report_type_fkey FOREIGN KEY (report_type) REFERENCES cdm_v1.report_type(type);


--
-- Name: header_table header_table_sea_level_datum_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_sea_level_datum_fkey FOREIGN KEY (sea_level_datum) REFERENCES cdm_v1.sea_level_datum(datum);


--
-- Name: header_table header_table_source_id_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_source_id_fkey FOREIGN KEY (source_id) REFERENCES cdm_v1.source_configuration(source_id);


--
-- Name: header_table header_table_station_type_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_station_type_fkey FOREIGN KEY (station_type) REFERENCES cdm_v1.station_type(type);


--
-- Name: header_table header_table_sub_region_fkey; Type: FK CONSTRAINT; Schema: cdm_v1; Owner: glamod_dbroot
--

ALTER TABLE ONLY cdm_v1.header_table
    ADD CONSTRAINT header_table_sub_region_fkey FOREIGN KEY (sub_region) REFERENCES cdm_v1.sub_region(sub_region);


--
-- Name: TABLE header_table; Type: ACL; Schema: cdm_v1; Owner: glamod_dbroot
--

GRANT SELECT ON TABLE cdm_v1.header_table TO webuser;


--
-- PostgreSQL database dump complete
--
```