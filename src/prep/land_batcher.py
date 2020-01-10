import os
import glob
import pandas as pd

BATCH_FILE = '../data/land_cdmlite_batch_rules.txt'
HEADER_DIRS_LIST = '../data/header_dirs.txt'

COMMON_BASE_DIR = '/gws/nopw/j04/c3s311a_lot2/data/beta_fix7'
HEADER_BASE_DIR = os.path.join(COMMON_BASE_DIR, 'header_table')
OBSERVATION_BASE_DIR = os.path.join(COMMON_BASE_DIR, 'observations_table')

HEADER_DIRS = None


def get_header_file_list():
    global HEADER_DIRS

    if not HEADER_DIRS:
        print('[INFO] Loading header list...')
        HEADER_DIRS = open(HEADER_DIRS_LIST).read().strip().split()

    return HEADER_DIRS


class LandBatcher(object):
    """
    Columns are: path_prefix|batch_id|n_batches|batch_length
    """

    def __init__(self, batch_file=BATCH_FILE):
        self._batch_file = batch_file
        self._load()

    def _load(self):
        self._df = pd.read_csv(self._batch_file, sep='|')
        self.batches = sorted(list(self._df.batch_id.unique()))

    def get_batches(self):
        return self.batches[:]

    def get(self, batch_id, ftype='header'):
        if batch_id not in self.batches:
            raise KeyError(f'Batch not found: {batch_id}')

        header_files = get_header_file_list()        
        path_prefix = self._df[self._df['batch_id'] == batch_id]['path_prefix'].tolist()[0].strip('*')

        prefix = os.path.join(HEADER_BASE_DIR, path_prefix)
        files = []

        for f in header_files:
            if f.startswith(prefix):
                files.extend(glob.glob(f'{f}/*.psv')) 

        if ftype.startswith('obs'):
        # Observation paths need mapping 
            files = [_.replace('header_table/', 'observations_table/') \
                      .replace('header_table', 'observation_table') \
                      for _ in files] 

        return files

    def get_report_type(self, batch_id):
        report_types = ['sub_daily', '_', 'monthly', 'daily']

        for r in report_types:
            if batch_id.startswith(r):
                return report_types.index(r)

        raise KeyError(f'Cannot work out report_type for batch: {batch_id}')


def test():

    x = LandBatcher()
    batch_id = x.batches[10]
    fs = x.get(batch_id)
    print(fs[0])
    print(len(fs))
    print(x.get_report_type(batch_id))
    print(x.get_batches()[:5], '...')
    print(x.get(batch_id, 'observations')[0])


if __name__ == '__main__':

    test() 
