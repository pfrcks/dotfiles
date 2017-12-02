#!/usr/bin/env python
import urllib2


url = 'https://in.bookmyshow.com/buytickets/dunkirk-bengaluru/movie-bang-ET00044852-MT/20170721'
req = urllib2.Request(url, headers={'User-Agent' : "Magic Browser"})
html = urllib2.urlopen(req).read().split('\n')
for item in html:
    if "VenueName" in item and "PVR" in item:
        print item.upper()
    else:
        print "Not yet out".upper()
