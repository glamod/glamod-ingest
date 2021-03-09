import pandas as pd
import datetime as dt


def test_timezone_conversion():

    start = pd.to_datetime('2015-02-24')
    rng = pd.date_range(start, periods=10)
    df = pd.DataFrame({'Date': rng, 'a': range(10)})

    df.Date = df.Date.dt.tz_localize('CET')
    assert all(date_t.tzname() == 'CET' for date_t in df.Date)

    df.Date = pd.to_datetime(df.Date, utc=True)
    assert all(date_t.tzname() == 'UTC' for date_t in df.Date)

    df.Date = df.Date.apply(lambda x: x.replace(tzinfo=None))
    adjusted_rng = [date_t - dt.timedelta(hours=1) for date_t in rng]

    assert  adjusted_rng == list(df.Date)
