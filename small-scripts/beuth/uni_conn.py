#! /usr/bin/env python
import pycurl   

def data_heaven(buffer):
    pass

data = "url=http://www.google.de&userid=s38371&password=4dssRC.N"
url = "https://mc2.tfh-berlin.de:8081/vpn/loginUser"
p = pycurl.Curl()
p.setopt(pycurl.URL, url) 
p.setopt(pycurl.POST, 1)
p.setopt(pycurl.POSTFIELDS, data)
p.setopt(pycurl.SSL_VERIFYPEER, False)
p.setopt(pycurl.WRITEFUNCTION, data_heaven)
try:
    print "Trying to establish a connection with mc2.tfh-berlin.de..."
    p.perform()
    print "Connection established with mc2." 
except pycurl.error as e:
    print "Some error occured with mc2. Now trying with mc1..."
    p.setopt(pycurl.URL, "https://mc1.tfh-berlin.de:8081/vpn/loginUser")
    try:
        p.perform()
        print "Connection established with mc1."
    except:
        print "mc1 also not working. I have to give up :("

