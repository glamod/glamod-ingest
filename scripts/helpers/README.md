# Helper scripts

This directory contains a set of scripts that were written as quick 
fixes and workarounds. They are not part of standard workflow but 
are retained here just in case they are useful.

## fix-cdmlite-column-order.sh

Swaps around the last two columns:

- from: <location>|<source_id>
- to:   <source_id>|<location>

Usage:

```
fix-cdmlite-column-order.sh <file.psv>
```

## batch-fix-cdmlite-column-order.sh

A wrapper around the `fix-cdmlite-column-order.sh` script, to run
on all PSV files found under the directory given.

Usage:

```
batch-fix-cdmlite-column-order.sh <dir>
```

## delete-schema-and-tables.sh

!DANGER!DANGER!DANGER!

**THIS WILL DELETE ALL YOUR DATA!**

Usage:

```
delete-schema-and-tables.sh <schema_name>
```

## lookup-source-config.py

A script to look up how many source_id values a single observation
maps to (which should be exactly ONE).

Usage:

```
python -i lookup-source-config.py CA001091174 2 daily
```