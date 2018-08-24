#!/usr/bin/env python
import sys
import numpy as np

def pudb_stringifier(obj):
    if type(obj) == type(sys):
        return ''
    else:
        return type(obj)
