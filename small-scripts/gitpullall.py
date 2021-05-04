#! /usr/bin/env python3
import os
import sys
import shlex
import argparse
from subprocess import Popen
from multiprocessing.dummy import Pool as ThreadPool

def pull_or_clone_git(git):
    print('Checking ' + git[0])
    if os.path.exists(git[0]):
        Popen(['git', 'pull', '--all'], cwd=(git[0])).communicate()
        print('')
    else:
        args = shlex.split('git clone ' + git[1] + ' ' + git[0])
        Popen(args).communicate()
        # now track all remote branches
        # git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done

parser = argparse.ArgumentParser()
parser.add_argument('--user', default='felix')
parser.add_argument('--work', action='store_true')
parser.add_argument('--helixer', action='store_true')
args = parser.parse_args()

git_home_dir = '/home/' + args.user + '/git/'
repos = [
    (git_home_dir + 'scripts', 'git@github.com:soi/scripts.git'),
    (git_home_dir + 'misc', 'git@github.com:soi/misc.git'),
]

if args.helixer:
    repos += [
        (git_home_dir + 'Helixer', 'git@github.com:weberlab-hhu/Helixer.git'),
        (git_home_dir + 'GeenuFF', 'git@github.com:weberlab-hhu/GeenuFF.git'),
        (git_home_dir + 'helixer_scratch', 'git@github.com:weberlab-hhu/helixer_scratch.git'),
    ]

if args.work:
    repos += [
        (git_home_dir + '2020-06-kit-atmospheric-chemistry', 'git@gitlab.dkrz.de:aim/2020-06-kit-atmospheric-chemistry.git'),
        (git_home_dir + '2020-11-hzg-rogue-waves', 'git@gitlab.dkrz.de:aim/2020-11-hzg-rogue-waves.git'),
        (git_home_dir + 'ml-notebook-collection', 'git@gitlab.dkrz.de:aim/ml-notebook-collection.git'),
        (git_home_dir + 'aimtorch', 'git@gitlab.dkrz.de:aim/aimtorch.git'),
    ]


pool = ThreadPool(10)
pool.map(pull_or_clone_git, repos)
