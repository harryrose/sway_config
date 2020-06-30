#!/usr/bin/env bash

copyFn=wl-copy
pasteFn=wl-paste
original=`$pasteFn`
converted=`$pasteFn | ~/.config/sway/date-convert.py`
if [ $? -eq 0 ] 
then
  echo -n $converted | $copyFn
  notify-send "Date converted" "$original is $converted"
else
  notify-send "Unable to convert timestamp" "Clipboard does not contain a valid timestamp"
fi
