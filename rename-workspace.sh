#!/usr/bin/bash

read -p "new name: " name
if [[ "$name" != "" ]] 
then
  swaymsg rename workspace to $name
fi
