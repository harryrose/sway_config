#!/usr/bin/env bash

if [[ $# < 1 ]]
then
  echo "Usage:"
  echo " $0 <command>"
  exit 1
fi

case $1 in
  "stop")
    watson stop || true
    notify-send "Timer" "Timer stopped"
    ;;
  "start")
    watson stop 2>&1 > /dev/null || true
    watson projects | fzf --print-query | xargs watson start  
    notify-send "Timer" "$(watson status -p) started"
    ;;
  "notify-status")
    notify-send "Timer" "$(watson status)"
    ;;
  *)
    echo "Unknown command $1"
    exit 2
    ;;
esac
