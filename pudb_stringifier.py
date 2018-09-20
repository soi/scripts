#!/usr/bin/env python
import sys

def pudb_stringifier(obj):
    def dummy():
        pass
    if type(obj) == type(sys) or type(obj) == type(dummy):
        return ''
    else:
        if len(str(obj)) < 400: #this is the problem
            return obj
        else:
            if hasattr(obj, '__len__'):
                return str(type(obj)).split("'")[1] + " (" + str(len(obj)) + ")"
            else:
                return type(obj)
