#!/bin/bash

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
