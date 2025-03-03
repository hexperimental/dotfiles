#!/bin/bash

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
