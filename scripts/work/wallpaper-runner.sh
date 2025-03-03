#!/bin/sh
# Path to wallpaper folders
WALLPAPERS=~/dotfiles/images/wallpapers/

# Get a random image from the folder
RANDOM_WALLPAPER=$(find "$WALLPAPERS" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.bmp" \) | shuf -n 1)

# Set the wallpaper with feh
if [ -n "$RANDOM_WALLPAPER" ]; then
    feh --bg-scale "$RANDOM_WALLPAPER"
else
    notify-send "No wallpapers found in $WALLPAPERS"
fi
