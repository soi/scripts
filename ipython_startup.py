import sys, os
import numpy as np
import matplotlib.pyplot as plt
from pprint import pprint
import sklearn
import h5py
import random

plt.interactive(True)

np.set_printoptions(linewidth = 75)
np.set_printoptions(threshold=np.inf)

a = np.arange(10)
b = np.arange(100)
d = {'eins': 1, 'zwei': 2}

AMINO_ACIDS = '-ACDEFGHIKLMNPQRSTVWY'
ctable = CharacterTable(AMINO_ACIDS)
