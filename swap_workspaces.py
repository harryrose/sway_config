#!/usr/bin/env python3
import sys
from i3ipc import Connection

if len(sys.argv) < 3:
    print("Usage: ")
    print(" %s <A-output> <B-output>" % sys.argv[0])
    sys.exit(1)


i3 = Connection()

def first(l, it):
    filtered = list(filter(l, it))
    if len(filtered) <= 0:
        return None
    return filtered[0]

def current_focused_workspace(con):
    return con.get_tree().find_focused().workspace().name

def current_workspace(con, outputName):
    output = first(lambda x : x.name == outputName, con.get_outputs())
    if output is None:
        return None
    return output.current_workspace

def swap_workspaces(con, aOutput, bOutput):
    a_ws = current_workspace(con, aOutput)
    b_ws = current_workspace(con, bOutput)

    print("A workspace: %s\nB workspace: %s" % (a_ws, b_ws))
    if a_ws is None or b_ws is None:
        print("either workspace %s or %s was not found" % (a_ws, b_ws))
        return

    i3.command("focus output %s" % aOutput)
    i3.command("move workspace to %s" % bOutput)
    i3.command("focus output %s" % bOutput)
    i3.command("workspace %s" % b_ws)
    i3.command("move workspace to %s" % aOutput)
   
current_focused = current_focused_workspace(i3)
swap_workspaces(i3, sys.argv[1], sys.argv[2])
i3.command("workspace %s" % current_focused)
