import datetime
import os
import time
import random


class FileLock(object):
    def __init__(self, fpath):
        self._fpath = fpath
        dr = os.path.dirname(fpath)
        if not os.path.isdir(dr):
            os.makedirs(dr)

        self.state = "UNLOCKED"

    def acquire(self, timeout=30):
        start = datetime.datetime.now()
        deadline = start + datetime.timedelta(seconds=timeout)

        while datetime.datetime.now() < deadline:
            if not os.path.isfile(self._fpath):
                open(self._fpath, "w")
                break

            print(f'[INFO] Sleeping whilst waiting to unlock pickle file...')
            time.sleep(random.randint(1, 9) * 0.3)
        else:
            raise Exception(f"Could not obtain file lock: {self._fpath}")

        self.state = "LOCKED"

    def release(self):
        if os.path.isfile(self._fpath):
            try:
                os.remove(self._fpath)
            except FileNotFoundError:
                pass

        self.state = "UNLOCKED"
