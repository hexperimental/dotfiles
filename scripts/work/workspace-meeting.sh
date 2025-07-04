#!/bin/bash

# This script  sets up a 'meeting space' on i3 ready to work. browser for meeting on top and nvim for notes on the bottom. 

# Switch to workspace 0
i3-msg "workspace 0"
# Open Firefox on Google Calendar (top half)
i3-msg "exec firefox --new-window https://calendar.google.com"
sleep 1  # Allow time for the browser to launch
# Split vertically for the terminal
i3-msg "split v"
# Open terminal with Neovim (bottom half)
i3-msg "exec gnome-terminal -- bash -i -c 'meetingnote'"
sleep 1  # Give it time to open
# Adjust layout to ensure proper split
i3-msg "focus down"
# Final focus on nvim
i3-msg "focus down"

# This part is to setup the other displays like torches. 

sleep 1  # Give it time to open

# HERE add empty browser windows to external displays 11 and 7



