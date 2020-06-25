#!/usr/bin/env python
import sys
import json
workspaces = ["1","2","3","4","5","6","7","8","9"]

data = json.load(sys.stdin)

for ws in workspaces:
    if ws not in data:
        print(ws)
        sys.exit(0)

print(workspaces[0])
sys.exit(1)
