#! /usr/bin/env python3
import matplotlib.pyplot as plt
import numpy as np
import argparse
import sys
from pprint import pprint

parser = argparse.ArgumentParser()
parser.add_argument('-d', '--dataset', type=str, default='')
parser.add_argument('-b', '--bars', type=int, default=100)
parser.add_argument('-co', '--cutoff', type=int, default=10**9)
parser.add_argument('-l', '--log', action='store_true')
parser.add_argument('-s', '--save', type=str, default='')
args = parser.parse_args()

print()
pprint(vars(args))

def get_data_from_iter(iterator):
    n_total = 0
    n_cutoff = 0
    values = []
    for line in iterator:
        if line.strip():
            n_total += 1
            value = float(line.strip())
            if value <= args.cutoff:
                values.append(value)
            else:
                n_cutoff += 1
    print('cut off {}/{} values ({:.4f}%)'.format(n_cutoff, n_total, n_cutoff/n_total * 100))
    return values

if args.dataset:
    values = get_data_from_iter(open(args.dataset))
else:
    values = get_data_from_iter(sys.stdin)

plt.hist(values, args.bars)
if args.log:
    plt.xscale('log')

if args.save:
    plt.savefig(args.save, dpi=300)
plt.show()
