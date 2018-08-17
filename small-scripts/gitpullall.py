#! /usr/bin/env python3

from subprocess import Popen
import os
import sys
import getpass
import shlex
import logging

# get username from parameters or the user running this
if len(sys.argv) < 2:
    USER = getpass.getuser()
else:
    USER = sys.argv[1]

GIT_HOME_DIR = '/home/' + USER + '/git/'
GIT_LIST = [
                (GIT_HOME_DIR + 'phd', 'git@github.com:soi/phd.git'),
                (GIT_HOME_DIR + 'PairwiseMHCRanking', 'git@github.com:DiltheyLab/PairwiseMHCRanking.git'),
                (GIT_HOME_DIR + 'scripts', 'git@github.com:soi/scripts.git'),
                (GIT_HOME_DIR + 'misc', 'git@github.com:soi/misc.git'),
           ]
LOG_FILE = '/home/' + USER + '/.gitpullall.log'

logging.basicConfig(filename=LOG_FILE, format='%(asctime)s - %(message)s', level=logging.DEBUG)
logging.debug('*** New run *** - checking ' + str(len(GIT_LIST)) + ' repositories')
for git in GIT_LIST:

    print('Checking ' + git[0])
    if os.path.exists( git[0] ):
        logging.debug("Pulling into " + git[0])
        Popen(['git', 'pull'], cwd=( git[0] )).communicate()
        print('')
    else:
        logging.debug(git[0] + ' not existing. cloning now from ' + git[1])

        args = shlex.split('git clone ' + git[1] + ' ' + git[0])
        Popen(args).communicate()
