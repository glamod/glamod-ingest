import os
import pickle
import time

from .file_lock import FileLock
PAUSE = 0.2


class PickleDict:

    def __init__(self, dict_file):
        self._dict_file = dict_file
        self._lock = FileLock(f"{dict_file}.lock")

    def _read(self):
        self._lock.acquire()

        if os.path.isfile(self._dict_file):
            content = pickle.load(open(self._dict_file, "rb")) or {}
        else:
            content = {}

        self._lock.release()
        return content

    def read(self):
        return self._read()

    def _write(self, content):
        self._lock.acquire()

        with open(self._dict_file, "wb") as f:
            pickle.dump(content, f)

        self._lock.release()

    def add(self, key, value):
        content = self._read()
        content[key] = value

        time.sleep(PAUSE)
        self._write(content)

    def clear(self, key):
        content = self._read()

        if key in content:
            print(f"[INFO] Clearing from dict: {key}")
            del content[key]

        time.sleep(PAUSE)
        self._write(content)

    def contains(self, key):
        content = self._read()
        return key in content

