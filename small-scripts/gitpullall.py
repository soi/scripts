#! /usr/bin/env python3
import os
import sys
import getpass
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
        (git_home_dir + 'HelixerPrep', 'git@github.com:alisandra/HelixerPrep.git'),
        (git_home_dir + 'GeenuFF', 'git@github.com:weberlab-hhu/GeenuFF.git'),
        (git_home_dir + 'helixer_scratch', 'git@github.com:weberlab-hhu/helixer_scratch.git')
    ]

if args.work:
    repos += [
        (git_home_dir + '2020-03-gfz-remote-sensing', 'git@gitlab.dkrz.de:aim/2020-03-gfz-remote-sensing.git'),
        (git_home_dir + '2020-05-geomar-feature-selection', 'git@gitlab.dkrz.de:aim/2020-05-geomar-feature-selection.git'),
        (git_home_dir + '2020-06-kit-atmospheric-chemistry.git', 'git@gitlab.dkrz.de:aim/2020-06-kit-atmospheric-chemistry.git'),
        (git_home_dir + 'dynamic-data-loader', 'git@gitlab.dkrz.de:aim/dynamic-data-loader.git'),
        (git_home_dir + 'ml-notebook-collection', 'git@gitlab.dkrz.de:aim/ml-notebook-collection.git'),
        (git_home_dir + 'cookiecutter-voucher', 'git@gitlab.dkrz.de:aim/cookiecutter-voucher.git'),
        (git_home_dir + '2020-99-hzg-new-voucher', 'git@gitlab.dkrz.de:aim/2020-99-hzg-new-voucher.git'),
        (git_home_dir + 'AIMTorch', 'git@gitlab.dkrz.de:aim/aimtorch.git'),
    ]


pool = ThreadPool(8)
pool.map(pull_or_clone_git, repos)
