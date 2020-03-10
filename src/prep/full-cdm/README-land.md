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
 - load with:


contact:

 - original:
   - /gws/nopw/j04/c3s311a_lot2/data/level2/land/source_configuration/contact_ffr.csv
 - insert nulls:
   - tidy-psv.py /gws/nopw/j04/c3s311a_lot2/data/level2/land/source_configuration/contact_ffr.csv \
                 /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/contact/contact.psv

 - manually removed non-ASCII chars in `vi`
   - /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/source_configuration/source-config-non-ascii-fixed.psv
 - then run script to generate version ready to load:
   - /gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/source_configuration/source-configuration.psv
