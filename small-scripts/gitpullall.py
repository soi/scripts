#! /usr/bin/env python3
import os
import sys
import getpass
import shlex
from subprocess import Popen
from multiprocessing.dummy import Pool as ThreadPool

def pull_or_clone_git(git):
    print('Checking ' + git[0])
    if os.path.exists(git[0]):
        Popen(['git', 'pull'], cwd=(git[0])).communicate()
        print('')
    else:
        args = shlex.split('git clone ' + git[1] + ' ' + git[0])
        Popen(args).communicate()

if len(sys.argv) < 2:
    USER = getpass.getuser()
else:
    USER = sys.argv[1]

GIT_HOME_DIR = '/home/' + USER + '/git/'
GIT_LIST = [
    (GIT_HOME_DIR + 'phd', 'git@github.com:soi/phd.git'),
    (GIT_HOME_DIR + 'PairwiseMHCRanking', 'git@github.com:DiltheyLab/PairwiseMHCRanking.git'),
    (GIT_HOME_DIR + 'scripts', 'git@github.com:soi/scripts.git'),
    (GIT_HOME_DIR + 'misc', 'git@github.com:soi/misc.git')
]

pool = ThreadPool(8)
dists = pool.map(pull_or_clone_git, GIT_LIST)
