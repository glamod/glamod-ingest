# Testing specific batches and stations

## De-bugging an error

Sometimes a failure is logged, such as:

```
$ more /gws/smf/j04/c3s311a_lot2/cdmlite/log/prep/land/failure/3/3-1904-daily-T3_protect-header_table_BETA_USC00095.psv
Lengths of obs (9440) and merged (9443) are different.
```

So, we want to:

 - only test that batch
 - test each of the related stations
 - only test that year
 - run in "dry-run" mode so that no output files are actually produced

Here is how to do it:

 1. Identify the batch:
  `BATCH=daily-T3_protect-header_table_BETA_USC00095`

 2. Identify the year:
  `YEAR=1904`

 3. Run with `verbose` and `dry_run` mode set:
  `python restructure-land.py -b $BATCH -y $YEAR -vv --dry-run`

It outputs a list of Header Files, you can then plug each one back into the script with the `-H` argument:

  `python restructure-land.py -b $BATCH -y $YEAR -vv --dry-run -H /gws/nopw/j04/c3s311a_lot2/data/beta_fix7/header_table/daily/T3_protect/header_table_BETA_USC00095874_4/header_table_BETA_USC00095874_4.1904.psv` 
