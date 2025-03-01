#!/bin/sh
# Path to wallpaper folders
WALLPAPERS=~/dotfiles/images/
cd $WALLPAPERS
selected=$(exa $WALLPAPERS|rofi -dmenu -p "Random Wallpaper Folder: ")&&feh --no-fehbg --bg-max --randomize "$selected"/*
