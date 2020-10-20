import os
import subprocess as sp

import pandas as pd

from glamod.prepare.height_handler import fix_land_height


def _call_script(cmd):
    resp = sp.run(cmd, shell=True, env=os.environ, capture_output=True, check=True)
    return resp

def test_height_handler():
    df = pd.DataFrame({'observed_variable': [85, 2000, 107, 1]})
    fix_land_height(df)
    assert('height_above_surface' in df.columns.tolist())


def test_restructure_land():
    batch_id = 'CDM_lite_SecondRelease_ACW00011'
    cmd = f'python scripts/land/restructure-land.py -b {batch_id} -y 1958 -v'
    try:
        resp = _call_script(cmd)
    except Exception:
        print(resp.stdout)

    assert(resp.returncode == 0)