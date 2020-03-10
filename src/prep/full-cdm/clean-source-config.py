#!/usr/bin/env python

import pandas as pd

SC_FILE = '/gws/nopw/j04/c3s311a_lot2/data/level2/land/source_configuration/source_configuration_ffr.csv'
SC_FILE = '/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/source_configuration/source-config-non-ascii-fixed.psv'
SC_FIXED_FILE = '/gws/nopw/j04/c3s311a_lot2/data/ingest/r202003/full-cdm/land/source_configuration/source-configuration.psv'
print(f'[WARN] File already had unicode chars removed: {SC_FILE}')


def _fix(x):
    if type(x) == str:
        x = x.strip().replace('  ', ' ')

    return x


def fix_array_fields(df):
    """
    Array fields:

 product_references               | character varying[]      |           |          |
 product_citation                 | character varying[]      |           |          |
 contact                          | character varying[]      |           |          |
 contact_role                     | integer[]                |           |          |
 metadata_contact                 | character varying[]      |           |          |
 metadata_contact_role            | integer[]                |           |          |
    """
    ARRAY_FIELDS = 'product_references product_citation contact contact_role metadata_contact metadata_contact_role'.split()
    dtypes = 'char char char int char int'.split()

    for i, afield in enumerate(ARRAY_FIELDS):

        print(afield, '-->')
        print(df[afield].values) 
        dtype = dtypes[i]

        values = []

        for value in df[afield]:
                 
            if pd.notna(value):
                if dtype == 'char':
                    value = '{' + f'{value}' + '}'
                elif dtype == 'int':
                    value = f'{{{value}}}'    
          
            values.append(value)

        df[afield] = values[:]
        print(df[afield])
       
    return df


def add_location(df):
    locations = []

    for field in 'bbox_min_longitude bbox_min_latitude bbox_max_latitude bbox_max_longitude'.split():
        df[field] = df[field].astype(float)

    for index, x in df.iterrows():
        polygon = 'SRID=4326;POLYGON(({:.3f} {:.3f},{:.3f} {:.3f},{:.3f} {:.3f},{:.3f} {:.3f},{:.3f} {:.3f}))' \
                                        .format(x['bbox_min_longitude'], x['bbox_min_latitude'],
                                                x['bbox_min_longitude'], x['bbox_max_latitude'],
                                                x['bbox_max_longitude'], x['bbox_max_latitude'],
                                                x['bbox_max_longitude'], x['bbox_min_latitude'],
                                                x['bbox_min_longitude'], x['bbox_min_latitude'])
        

        print(polygon)
        locations.append(polygon)

    df['location'] = locations


def clean(sc_file=SC_FILE, output=SC_FIXED_FILE):

    df = pd.read_csv(sc_file, sep='|', dtype=object)

    df = df.rename(columns=lambda x: x.strip())
    df = df.applymap(lambda x: _fix(x))
    df['product_status'] = '0'

    add_location(df)

    df = fix_array_fields(df)

#    columns = list(df.columns)
#    columns.append('location')

    print(df.columns)
    print(df.loc[0])
    df.to_csv(output, sep='|', index=False, na_rep='NULL') #, columns=columns) 
    print(f'[INFO] Wrote: {output}')


if __name__ == '__main__':

    clean()
