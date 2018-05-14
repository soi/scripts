#! /usr/bin/python

from bs4 import BeautifulSoup
import urllib2
import re

html = urllib2.urlopen("http://www.ti.informatik.hu-berlin.de/teaching/ws/pak").read()

soup = BeautifulSoup(html)
links = soup.find(id="content-core").find_all('a')
p = re.compile('.*\.pdf$')

for link in links:
    if p.match(link.get('href')):


