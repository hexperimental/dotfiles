#!/bin/bash

# Command and Control
i3-msg "workspace 1"
# Open the first terminal (top-left)
i3-msg "exec gnome-terminal"
sleep 0.5
# Split horizontally and open Obsidian (top-right)
i3-msg "split h"
i3-msg "exec obsidian"
sleep 1
# Focus back to the terminal, split vertically, and open Firefox (bottom, full width)
i3-msg "focus left"
i3-msg "split v"
i3-msg "exec firefox"
sleep 1
# Adjust layout to ensure Firefox takes full width
i3-msg "focus down"
i3-msg "resize grow height 50 px"
i3-msg "resize grow height 50 px"
i3-msg "resize grow height 50 px"
# Final focus back to the top-left terminal
i3-msg "focus up"
i3-msg "focus left"


