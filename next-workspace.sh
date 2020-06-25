#!/bin/bash

next=`swaymsg -t get_workspaces -r | jq '[ .[] | .name ] | sort' | ~/.config/sway/next-workspace.py`

if [[ "$1" = "switch" ]]
then
  swaymsg workspace $next
elif [[ "$1" = "move" ]]
then
  swaymsg move container to workspace $next && notify-send "Container Moved" "The container has been moved to workspace $next"
fi

