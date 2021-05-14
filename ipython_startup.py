import sys, os
import numpy as np
import matplotlib.pyplot as plt
from pprint import pprint
import random
import math
import h5py

plt.interactive(True)

# np.set_printoptions(linewidth = 75)
np.set_printoptions(threshold=np.inf)

a = np.arange(10)
b = np.arange(100).reshape(10, 10)
c = np.arange(1000).reshape(10, 10, 10)
d = {'eins': 1, 'zwei': 2}
