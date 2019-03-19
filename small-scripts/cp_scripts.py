#! /usr/bin/env python3
import sys, os
import filecmp
import shutil
import argparse
from subprocess import call

git_scripts_home = '/home/felix/git/scripts/'
files = [['/home/felix/.bash_aliases', git_scripts_home + '.bash_aliases'],
         ['/home/felix/.bashrc', git_scripts_home + '.bashrc'],
         ['/home/felix/.vimrc', git_scripts_home + '.vimrc'],
         ['/home/felix/.sqliterc', git_scripts_home + '.sqliterc'],
         ['/home/felix/.ipython/profile_default/ipython_config.py', git_scripts_home + 'ipython_config.py'],
         ['/home/felix/.ipython/profile_default/startup/ipython_startup.py', git_scripts_home + 'ipython_startup.py']]

parser = argparse.ArgumentParser()
parser.add_argument('-m', '--mode', default='invalid')
parser.add_argument('-dr', '--dry-run', action='store_true')
args = parser.parse_args()

assert args.mode in ['to-git', 'from-git'], 'Usage: -m [to-git, from-git] [--dry-run]'

changed_flag = False
if args.dry_run:
    print('**dry run**')
for file_pair in files:
    if args.mode == 'to-git':
        source_file, dest_file = file_pair[0], file_pair[1]
    else:
        source_file, dest_file = file_pair[1], file_pair[0]

    if not os.path.isfile(source_file):
        print(os.path.basename(source_file), 'does not exist at the source. Skipping.')
        continue

    if not os.path.isfile(dest_file) or not filecmp.cmp(source_file, dest_file):
        changed_flag = True
        if not args.dry_run:
            shutil.copyfile(source_file, dest_file)
        print(os.path.basename(source_file))

if not changed_flag:
    print('everything up-to-date')
