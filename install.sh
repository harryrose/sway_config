#!/usr/bin/env bash

#
# Installs the dependencies for this configuration
#

yay -S swayidle swaylock slurp waybar mako pamix-git grim wl-clipboard nerd-fonts-fira-code wf-recorder alacritty fzf

terminalConfig=~/.config/alacritty/alacritty.yml
waybarConfig=~/.config/waybar/
mkdir -p $(dirname $terminalConfig)
mkdir -p $(dirname $waybarConfig)

if [[ ! -d $waybarConfig ]]
then
  ln -s `pwd`/waybar/ $waybarConfig
else
  echo "Waybar configuration exists at $waybarConfig.  Will not overwrite"
fi

if [[ ! -f $terminalConfig ]]
then
  ln -s `pwd`/alacritty.yml $terminalConfig
else
  echo "Terminal configuration exists at $terminalConfig. Will not overwrite"
fi

