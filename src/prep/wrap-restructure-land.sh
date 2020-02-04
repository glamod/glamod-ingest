#!/bin/bash

#TODO:
#cd /path/to/repo
#source venv/bin/activate
export PYTHONWARNINGS=ignore

cd src/prep/
python ./restructure-land.py $@
