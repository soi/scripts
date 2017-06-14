import sys, os
import numpy as np
# import cv2
import matplotlib.pyplot as plt
# import Tkinter
from pprint import pprint
import sklearn
try:
    import _pickle as pickle #python2
except ImportError:
    import pickle

plt.interactive(True)

np.set_printoptions(linewidth = 75)

a = np.arange(10)
b = np.arange(100)
