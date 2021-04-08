import os
import time
import glob
import pandas as pd

import glamod.settings as gs
from glamod.utils import get_report_types


class LandBatcher(object):
    """
    Columns are: path_prefix|batch_id|n_batches|batch_length
    """

    def __init__(self, release):
        self.BATCH_FILE = gs.get(f'{release}:lite:land:batches:rules') # -> '../data/land_cdmlite_batch_rules.txt'
        self.FILE_LIST = gs.get(f'{release}:lite:land:batches:input_files') # -> '../data/cdmlite_input_files.txt'
        self.BASE_DIR = gs.get(f'{release}:lite:land:incoming:observations') # -> '/gws/nopw/j04/c3s311a_lot2/data/level2/land/cdm_lite/'
        
        self._load()
        self._input_files = None


    def _load(self):
        start = time.time()
        self._df = pd.read_csv(self.BATCH_FILE, sep='|')
        self.batches = sorted(list(self._df.batch_id.unique()))
        duration = time.time() - start
        print(f'[INFO] Took {duration:.4f} seconds to load batches')

    def get_batches(self):
        return self.batches[:]

    def get(self, batch_id):
        if batch_id not in self.batches:
            raise KeyError(f'Batch not found: {batch_id}')

        input_files = self.get_file_list()
        path_prefix = self._df[self._df['batch_id'] == batch_id]['path_prefix'].tolist()[0].strip('*')

        prefix = os.path.join(self.BASE_DIR, path_prefix)
        files = []

        for f in input_files:
            if f.startswith(prefix):
                files.append(f)

        return files

    def get_report_type(self, batch_id):
        report_types = get_report_types()

        for r in report_types:
            if batch_id.startswith(r):
                return report_types.index(r)

        raise KeyError(f'Cannot work out report_type for batch: {batch_id}')

    def get_file_list(self):
        start = time.time()

        if not self._input_files:
            print('[INFO] Loading file list...')
            self._input_files = open(self.FILE_LIST).read().strip().split()
            duration = time.time() - start
            print(f'[INFO] Took {duration:.4f} seconds to load batch...')

        return self._input_files


def test():

    x = LandBatcher('r3.0')
    batch_id = x.batches[0]
    fs = x.get(batch_id)
    print(fs)
    print(len(fs))
    print(x.get_report_type(batch_id))
    print(x.get_batches()[:5], '...')


if __name__ == '__main__':

    test() 
