# Land processing

## Login and set up environment

```
ssh sci3.jasmin.ac.uk

newgrp gws_c3s311a_lot2  # Not needed if you don't have too many Unix groups.

cd 
mkdir glamod
cd glamod/

git clone https://github.com/glamod/glamod-ingest

cd glamod-ingest/

# set environment
source ./setup-env-sci.sh
```

## Now decide the batch sizes to fix upon - for land data

For a new release 
```bash
$ find /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202102/cdm_lite  -type f -iname "*psv.gz" > /gws/nopw/j04/c3s311a_lot2/data/level2/land/r3.0/batches/cdmlite_input_files.txt
```

```
#withgroups gws_c3s311a_lot2 
python scripts/land/decide-land-batches.py r3.0  # "r3.0" is the release version
Fix? [Y/n] Y
Fix? [Y/n] Y
Fix? [Y/n] Y
```

The output should look like:

```
[INFO] Looking up: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/batches/cdmlite_input_files.txt
[INFO] Working on frequency: daily
N: 31, Number of batches: 5567, sizes: 1 - 491
Fix? [Y/n] Y
[INFO] FIXING: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/cdm_lite/daily/CDM_lite_SecondRelease_ZI000067
[INFO] Wrote 5567 records to: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/batches/cdmlite_batch_rules.txt
[INFO] Working on frequency: monthly
N: 30, Number of batches: 5519, sizes: 1 - 454
Fix? [Y/n] Y
[INFO] FIXING: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/cdm_lite/monthly/CDM_lite_FirstRelease_ZI000067
[INFO] Wrote 5519 records to: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/batches/cdmlite_batch_rules.txt
[INFO] Working on frequency: sub_daily
N: 32, Number of batches: 4662, sizes: 1 - 130
Fix? [Y/n] Y
[INFO] FIXING: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/cdm_lite/sub_daily/CDM_lite_SecondRelease_ZIM000679
[INFO] Wrote 4662 records to: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/batches/cdmlite_batch_rules.txt
```

## Now restructure the land data

Try running it for a single year and batch:

```
$ head -2 /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/batches/cdmlite_batch_rules.txt
path_prefix|batch_id|of_n_batches|batch_length
/gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/cdm_lite/daily/CDM_lite_SecondRelease_ACW00011*|daily-CDM_lite_SecondRelease_ACW00011|5567|2
```

So let's run with:

```
./scripts/land/restructure-land.py -r r2.0 -b daily-CDM_lite_SecondRelease_AF000040 -y 1975
```

This writes output such as:

```
[INFO] Loading file list...
[INFO] Reading: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/cdm_lite/daily/CDM_lite_SecondRelease_AF000040930.psv.gz to detect years.
[INFO] Working on 1975 for: daily-CDM_lite_SecondRelease_AF000040
[INFO] Reading input files: /gws/nopw/j04/c3s311a_lot2/data/level2/land/r202005/cdm_lite/daily/CDM_lite_SecondRelease_AF000040930.psv.gz , etc.
[INFO] Lengths of data frames before filtering years: [6283]
[INFO] Lengths of data frames AFTER filtering years: [241]
[INFO] Writing output file: /work/scratch-nopw/astephen/glamod/r2.0/cdmlite/prepare/land/3/1975/3-1975-daily-CDM_lite_SecondRelease_AF000040.psv
[INFO] Wrote: /work/scratch-nopw/astephen/glamod/r2.0/cdmlite/prepare/land/3/1975/3-1975-daily-CDM_lite_SecondRelease_AF000040.psv
[INFO] Wrote success file: /gws/smf/j04/c3s311a_lot2/workflow/r2.0/lite/land/outputs/log/success/3/3-1975-daily-CDM_lite_SecondRelease_AF000040.psv
```

Test the _prepare all_ script:

```
./scripts/land/prepare-all-land-lite.sh r2.0 local
```

It should keep running, but it is running locally, so eventually we want to exit it (because it will take forever if not run on LOTUS).

### Note about success and failure files

When re-running all, we need to delete success and failure files, e.g.:

```
find  /gws/smf/j04/c3s311a_lot2/workflow/r2.0/lite/land/outputs/log/ -type f -exec rm {} \;
```

I refactored this into a local script, based on my own paths:

```
$ more clear_log_data_dirs_prepare_land_cdmlite.sh 
find /work/scratch-nopw/astephen/glamod/r2.0/cdmlite/prepare /gws/smf/j04/c3s311a_lot2/workflow/r2.0/lite/land/outputs/log -type f -exec rm {} \;
rm -f last-land-batch.txt
```

### Restructure all land data in "batch" mode

This might take some days, depending on the LOTUS load.

```
./scripts/land/prepare-all-land-lite.sh r2.0 batch
```

This script limits the number of jobs in the queue to 250, and keeps sleeping then submitting more.

It also caches the last batch ID that was run to a local file (`last-land-batch.txt`) and when you re-run it, it will wait for a match of that before re-running/re-submitting any batches.

### How do you know all land batches have run to completion?

Indeed, essentially, you need to re-run all and check that there are no errors in the LOTUS outputs.

Here are some of the things I did:

#### Script to group jobs into only ~150 LOTUS jobs

A script to manage the whole task in about ~150 jobs on LOTUS:

```
./scripts/helpers/wrap-restructure-land-big-batches.sh
```

Which uses:

```
./scripts/helpers/restructure-land-batches-in-100s.sh
```

The LOTUS output files are all then written to the top-level directory. You can examine the sizes of them to check if they all ran.

## Generate the cdmlite land SQL files

```
./scripts/land/create-sqls-land.sh r2.0 0
./scripts/land/create-sqls-land.sh r2.0 2
./scripts/land/create-sqls-land.sh r2.0 3
```

## Load the cdmlite SQL files

```
./scripts/land/load-land-sql.sh r2.0 0
./scripts/land/load-land-sql.sh r2.0 2
./scripts/land/load-land-sql.sh r2.0 3
```

### Check the data loaded okay

You can check for any errors in the logs by gripping everything other than "COPY \d+". E.g.:

```
$ grep -vP "COPY a\d+"  /gws/smf/j04/c3s311a_lot2/workflow/r2.0/lite/land/populate/log/load-0-*.sql.log
$ grep -vP "COPY a\d+"  /gws/smf/j04/c3s311a_lot2/workflow/r2.0/lite/land/populate/log/load-2-*.sql.log
$ grep -vP "COPY a\d+"  /gws/smf/j04/c3s311a_lot2/workflow/r2.0/lite/land/populate/log/load-3-*.sql.log
```

If there is no output then we assume it worked!

## Troubleshooting

You might find that the `load` scripts are not able to connect to the database on the production server (`glamod2.ceda.ac.uk`). To fix this, update the `iptables` and `pg_hba.conf` files on the production server so that LOTUS nodes and/or `sci` servers can connect to the server.