#!/usr/bin/env bash

geom=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)

echo "args: $args"

filename="$HOME/Videos/screen-recordings/$(date +%Y%m%d%H%M%S).mp4"
mkdir -p $(dirname $filename)

wf-recorder -g "$geom" -f $filename

echo $filename | wl-copy
