#!/usr/bin/env python

from datetime import datetime, timezone
import dateutil.parser
import sys

for line in sys.stdin:
    line = line.strip()
    try:
        ts = int(line)
        print(datetime.utcfromtimestamp(ts).strftime("%Y-%m-%dT%H:%M:%SZ"))
        break
    except:
        pass

    try:
        t = dateutil.parser.isoparse(line) 
        print(int((t - datetime(1970,1,1,tzinfo=timezone.utc)).total_seconds()))
        break
    except:
        pass
    
    sys.exit(1)
