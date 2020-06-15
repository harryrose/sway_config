#!/usr/bin/env bash

#
# Installs the dependencies for this configuration
#

yay -S swayidle swaylock slurp i3blocks mako pamix-git grim wl-clipboard nerd-fonts-fira-code wf-recorder alacritty

terminalConfig=~/.config/alacritty/alacritty.yml
mkdir -p $(dirname $terminalConfig)

if [[ ! -f $terminalConfig ]]
then
  ln -s `pwd`/alacritty.yml $terminalConfig
else
  echo "Terminal configuration exists at $terminalConfig. Will not overwrite"
fi

