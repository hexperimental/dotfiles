#!/bin/bash

# Detect all connected displays
CONNECTED=($(xrandr --query | grep " connected" | awk '{print $1}'))

# Detect laptop (internal) display — assuming name includes "eDP"
LAPTOP=$(xrandr --query | grep " connected" | grep -i eDP | awk '{print $1}')

# Get external displays (all except eDP)
EXTERNALS=()
for OUT in "${CONNECTED[@]}"; do
    [[ "$OUT" != "$LAPTOP" ]] && EXTERNALS+=("$OUT")
done

echo "Laptop display: $LAPTOP"
echo "External displays: ${EXTERNALS[*]}"

# Always start clean: turn off all outputs first
for OUT in $(xrandr | grep " connected" | awk '{print $1}'); do
    xrandr --output "$OUT" --off
done

# Re-enable laptop display as base
xrandr --output "$LAPTOP" --auto --primary --pos 0x0 --rotate normal

# Arrange external monitors to the right of the laptop
if [ ${#EXTERNALS[@]} -gt 0 ]; then
    echo "Configuring ${#EXTERNALS[@]} external monitor(s)..."
    POS_X=$(xrandr --query | grep -w "$LAPTOP" | grep -oP "\d+x\d+\+\K\d+")
    WIDTH=$(xrandr --query | grep -w "$LAPTOP" | grep -oP "\d+x" | cut -dx -f1 | head -n1)
    [[ -z "$WIDTH" ]] && WIDTH=1920  # fallback if not detected
    POS_X=$WIDTH

    for OUT in "${EXTERNALS[@]}"; do
        echo " → Setting $OUT at position ${POS_X}x0"
        xrandr --output "$OUT" --auto --pos "${POS_X}x0" --rotate normal
        W=$(xrandr --query | grep -w "$OUT" | grep -oP "\d+x" | cut -dx -f1 | head -n1)
        [[ -z "$W" ]] && W=1920
        POS_X=$((POS_X + W))
    done
else
    echo "No external monitors detected. Laptop only."
fi

echo "Display setup complete."

# If i3 is running, refresh outputs and move all workspaces back to laptop screen
if pgrep -x i3 >/dev/null; then
    echo "Refreshing i3 layout..."

    # Force i3 to reload outputs (detects plugged/unplugged monitors)
    i3-msg -q reload
    sleep 0.5

    # Get all workspace names (JSON parsing via grep/sed)
    WORKSPACES=$(i3-msg -t get_workspaces | grep -o '"name":"[^"]*"' | sed 's/"name":"//;s/"//')

    # Move all workspaces to the laptop screen
    for WS in $WORKSPACES; do
        echo " → Moving workspace $WS to $LAPTOP"
        i3-msg -q "workspace \"$WS\"; move workspace to output $LAPTOP"
    done
fi
