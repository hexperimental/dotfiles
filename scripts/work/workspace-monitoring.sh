#!/bin/bash

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

