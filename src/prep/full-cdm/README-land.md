# Land ingestion: full-cdm

Incoming data:

```
/gws/nopw/j04/c3s311a_lot2/data/level2/land/source_configuration
/gws/nopw/j04/c3s311a_lot2/data/level2/land/station_configuration

/gws/nopw/j04/c3s311a_lot2/data/level2/land/header_tables
/gws/nopw/j04/c3s311a_lot2/data/level2/land/observations_tables
```

## Source configuration

organisation:

 - original: 
   - /gws/nopw/j04/c3s311a_lot2/data/level2/land/source_configuration/organisations_ffr.csv 
 - copied and manually edited non-ASCII characters:
   - vi /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/organisation/organisation-fixed-non-ascii.psv
 - tidied for loading:
   - tidy-psv.py /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/organisation/organisation-fixed-non-ascii.psv /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/organisation/organisation.psv
 - added an extra record for parent NOAA record
   - vi /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/organisation/organisation.psv
 - added NULL for parent org for NOAA
 - load with:
   - ./populate/full-cdm/load-land-organisation.sh

contact:

 - original:
   - /gws/nopw/j04/c3s311a_lot2/data/level2/land/source_configuration/contact_ffr.csv
 - insert nulls:
   - tidy-psv.py /gws/nopw/j04/c3s311a_lot2/data/level2/land/source_configuration/contact_ffr.csv \
                 /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/contact/contact.psv
 - load with:
   - ./populate/full-cdm/load-land-contact.sh

product_status:

 - not included from GitHub, so manually added with:
   - ./populate/full-cdm/load-product-status.sh

source_configuration:

 - manually removed non-ASCII chars in `vi`
   - /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/source_configuration/source-config-non-ascii-fixed.psv
 - then run script to generate version ready to load:
   - /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/source_configuration/source-configuration.psv
 - load with:
   - ./populate/full-cdm/load-land-source-config.sh

NOTE: Logs:
```
[root@glamod2 full-cdm]# ./load-land-source-config.sh
[INFO] Loading data from: /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/sqls/land/source_configuration/load-source-configuration.sql
[INFO] Logging to: /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/logs/land/populate/source_configuration/source-configuration.log
psql:/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/sqls/land/source_configuration/load-source-configuration.sql:2: NOTICE:  Coordinate values were coerced into range [-180 -90, 180 90] for GEOGRAPHY
```
