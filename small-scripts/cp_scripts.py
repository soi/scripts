#! /usr/bin/env python2
import sys, os
import filecmp
import shutil
import argparse
from subprocess import call

git_scripts_home = "/home/felix/git/scripts/"
files = [["/home/felix/.bash_aliases", git_scripts_home + ".bash_aliases"],
         ["/home/felix/.bashrc", git_scripts_home + ".bashrc"],
         ["/home/felix/.vimrc", git_scripts_home + ".vimrc"],
         ["/home/felix/.ipython/profile_default/ipython_config.py", git_scripts_home + "ipython_config.py"],
         ["/home/felix/.ipython/profile_default/startup/ipython_startup.py", git_scripts_home + "ipython_startup.py"]]

parser = argparse.ArgumentParser()
parser.add_argument("-m", "--mode", default="from-git")
# parser.add_argument("-c", "--commit", action="store_true")
args = parser.parse_args()

for file in files:
    if not filecmp.cmp(file[0], file[1]):
        if args.mode == "to-git":
            shutil.copyfile(file[0], file[1])
            print "copied", file[0], "to", file[1]
        if args.mode == "from-git":
            shutil.copyfile(file[1], file[0])
            print "copied", file[1], "to", file[0]
