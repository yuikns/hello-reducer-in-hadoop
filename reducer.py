#!/usr/bin/env python

import sys
import os

for line in sys.stdin:
    key, value = line.split("\t", 1)
    value = value.strip()
    pid = os.getpid()
    # 0: process id
    # 1: key(from random%x)
    # 2: value(lines)
    print ("%s\t%s\t%s" % (pid, key, value))


