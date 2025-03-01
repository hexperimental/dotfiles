#!/bin/bash

SCRIPT_DIR="$HOME/dotfiles/scripts"
SCRIPT_NAME="$1"

# Ensure script exists and is executable
if [[ -x "$SCRIPT_DIR/$SCRIPT_NAME" ]]; then
    exec "$SCRIPT_DIR/$SCRIPT_NAME"
else
    notify-send "Script not found or not executable: $SCRIPT_NAME"
fi
