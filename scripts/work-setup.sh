#!/bin/bash

#Disable mouse right-click
xinput set-prop "VEN_06CB:00 06CB:CE7E Touchpad" "libinput Click Method Enabled" 0 1

# Switch to workspace 3
# Communications
i3-msg "workspace 3"
# Open Slack (top-left)
i3-msg "exec slack"
sleep 1
# Split horizontally and open first Firefox window (top-right)
i3-msg "split h"
i3-msg "exec firefox"
sleep 1
# Focus back to Slack, split vertically, and open second Firefox window (bottom, full width)
i3-msg "focus left"
i3-msg "split v"
i3-msg "exec firefox --new-window"
sleep 1
# Adjust layout to ensure bottom Firefox takes full width
i3-msg "focus down"
i3-msg "resize grow height 50 px"
i3-msg "resize grow height 50 px"
i3-msg "resize grow height 50 px"
# Final focus back to Slack (top-left)
i3-msg "focus up"
i3-msg "focus left"

# Switch to workspace 1
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


# Set workspace 4
# Monitoring
i3-msg "workspace 4"
# Open the first terminal (left)
i3-msg "exec gnome-terminal"
sleep 0.5 
# Split horizontally and open the second terminal (right)
i3-msg "split h"
i3-msg "exec gnome-terminal"
sleep 0.5 
# Focus left (first terminal), split vertically, and open the third terminal (bottom)
i3-msg "focus left"
i3-msg "split v"
i3-msg "exec gnome-terminal"
sleep 0.5 
# Focus back to the top-left terminal
i3-msg "focus up"
i3-msg "focus left"
sleep 0.5 

# Switch to workspace 9
# Work
i3-msg "workspace 9"
# Open terminal on the left
i3-msg "exec gnome-terminal"
sleep 0.5  # Allow terminal to launch
# Split horizontally to prepare for PyCharm
i3-msg "split h"
# Open PyCharm on the right
i3-msg "exec pycharm"
sleep 1  # Allow PyCharm to launch
# Focus back on the terminal
i3-msg "focus left"
