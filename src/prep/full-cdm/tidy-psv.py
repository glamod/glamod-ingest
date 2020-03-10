#!/usr/bin/env python

import os
import sys

fin, fout = sys.argv[1:3]
outdir = os.path.dirname(fout)

if not os.path.isdir(outdir): os.makedirs(outdir)

lines = open(fin).readlines()

with open(fout, 'w') as writer:

    for line in lines:
        items = line.strip().split('|')
        items = [_.strip() or 'NULL' for _ in items]

        new_line = '|'.join(items) + '\n'
        writer.write(new_line)

print(f'[INFO] Tidied version: {fout}') 
