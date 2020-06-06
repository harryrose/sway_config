#!/usr/bin/env bash

#
# Installs the dependencies for this configuration
#

yay -S swayidle swaylock slurp i3blocks mako pamix-git grim wl-clipboard termite nerd-fonts-fira-code wf-recorder

termiteConfig=~/.config/termite/config
mkdir -p $(dirname $termiteConfig)

if [[ ! -f $termiteConfig ]]
then
  echo "Writing termite configuration to $termiteConfig";
  echo "[colors]" > $termiteConfig
  echo "background=#000000" >> $termiteConfig
  echo  >> $termiteConfig
  echo "[options]" >> $termiteConfig
  echo "font = FiraCode Nerd Font Mono 10" >> $termiteConfig

else
  echo "Termite configuration exists at $termiteConfig. Will not overwrite"
fi

