# The "glamod-ingest" package

This package is a suite of tools for ingesting and managing the multi-terabyte
observations provided by the GLAMOD project.

The ingestion pipeline involves multiple steps that are run on mulitple servers.

## Setting your environment

You need to have access to the Unix group: `gws_c3s311a_lot2`

If you have access to more than 16 groups on JASMIN then you need to start your
session by setting the default group with:

``` 
newgrp gws_c3s311a_lot2 
```

When running on "sci" servers on JASMIN, set up with:

```
source ./setup-env-sci.sh
```

When running on "glamod" servers on JASMIN, set up with:

```
source ./setup-env-glamod.sh
```

## Testing

You can run some tests:

```
pytest test
```

## Marine ingestion

### CDMLite: Marine 

There is a wrapper script to run all conversions. 

To run all, on release 2, sequentially on the local server:

```
scripts/marine/prepare-all-marine-lite.sh r2.0 
```

To run it ALL on LOTUS:

```
scripts/marine/prepare-all-marine-lite.sh r2.0 batch
```



