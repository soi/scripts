#! /usr/bin/env python3
import matplotlib.pyplot as plt
import numpy as np
import argparse
import sys
from pprint import pprint

parser = argparse.ArgumentParser()
parser.add_argument('-d', '--dataset', type=str, default='')
parser.add_argument('-b', '--bars', type=int, default=100)
parser.add_argument('-co-start', '--cutoff-start', type=float, default=np.NINF)
parser.add_argument('-co-end', '--cutoff-end', type=float, default=np.Inf)
parser.add_argument('-title', '--title', type=str, default='')
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
            if value >= args.cutoff_start and value <= args.cutoff_end:
                values.append(value)
            else:
                n_cutoff += 1
    cutoff_perc = n_cutoff/n_total * 100
    print(f'cut off {n_cutoff}/{n_total} values ({cutoff_perc:.4f}%)')
    return values

if args.dataset:
    values = get_data_from_iter(open(args.dataset))
else:
    values = get_data_from_iter(sys.stdin)

plt.hist(values, args.bars)
plt.title(f'{args.title} (cutoff: {cutoff_perc}%)')
if args.log:
    plt.xscale('log')

if args.save:
    plt.savefig(args.save, dpi=300)
plt.show()
