#!/usr/bin/bash
alacritty -t "switch workspace" -e bash -c "swaymsg -t get_workspaces -r | jq -r '.[] | .name' | sort | fzf | xargs swaymsg workspace"
