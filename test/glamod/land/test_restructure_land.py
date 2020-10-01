import pandas as pd

from lib.glamod.prepare.height_handler import fix_land_height


def test_height_handler():
    df = pd.DataFrame({'observed_variable': [85, 2000, 107, 1]})
    fix_land_height(df)
    assert('height_above_surface' in df.columns.tolist())