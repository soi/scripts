#! /usr/bin/env python
import os, sys
import Image

size = 128, 128

for infile in sys.argv[1:]:
    outfile = os.path.splitext(infile)[0] + ".thumbnail.png"
    if infile != outfile:
        try:
            im = Image.open(infile)
            im.thumbnail(size)
            im.save(outfile, "PNG")
        except IOError:
            print "cannot create thumbnail for", infile

