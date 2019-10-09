import os
import glob
import pandas as pd

BATCH_FILE = '../data/land_batch_rules.txt'
HEADER_FILES_LIST = '../data/header_files.txt'

COMMON_BASE_DIR = '/gws/nopw/j04/c3s311a_lot2/data/glamod_land_delivery_2018_12_31_Beta'
HEADER_BASE_DIR = os.path.join(COMMON_BASE_DIR, 'header_table')
OBSERVATION_BASE_DIR = os.path.join(COMMON_BASE_DIR, 'observations_table')

HEADER_FILES = None


def get_header_file_list():
    global HEADER_FILES

    if not HEADER_FILES:
        print('[INFO] Loading header list...')
        HEADER_FILES = open(HEADER_FILES_LIST).read().strip().split()

    return HEADER_FILES


class LandBatcher(object):
    """
    Columns are: path_prefix|batch_id|n_batches|batch_length
    """

    def __init__(self, batch_file=BATCH_FILE):
        self._batch_file = batch_file
        self._load()

    def _load(self):
        self._df = pd.read_csv(self._batch_file, sep='|')
        self.batches = list(self._df.batch_id.unique())

    def get(self, batch_id):
        if batch_id not in self.batches:
            raise KeyError(f'Batch not found: {batch_id}')

        header_files = get_header_file_list()        
        path_prefix = self._df[self._df['batch_id'] == batch_id]['path_prefix'].tolist()[0].strip('*')

        prefix = os.path.join(HEADER_BASE_DIR, path_prefix)
        files = [f for f in header_files if f.startswith(prefix)] 

        return files


def test():

    x = LandBatcher()
    batch_id = x.batches[10]
    fs = x.get(batch_id)
    print(fs[0])
    print(len(fs))

if __name__ == '__main__':

    test() 
