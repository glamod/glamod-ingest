#!/usr/bin/env python

import sys

from glamod.prepare.land_batcher import LandBatcher


args = sys.argv[1:]
if not args:
    raise Exception('Must provide a release as the only argument!')

batcher = LandBatcher(args[0])
batches = batcher.get_batches()

for batch_id in batches:
    print(batch_id)
