#!/bin/bash

export NO_AT_BRIDGE=1  # Suppress GTK warnings

OS=$(uname)

# Ensure a parameter is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <window_id>"
    exit 1
fi

WINDOW_ID="$1"

if [[ "$OS" == "Linux" ]]; then
    # Find a window matching the specified class name
    WINDOW=$(xdotool search --onlyvisible --class "$WINDOW_ID" | head -n 1)

    if [[ -n "$WINDOW" ]]; then
        echo "Window found: $WINDOW. Bringing it to focus."
        xdotool windowactivate "$WINDOW"
        xdotool windowmove "$WINDOW" 400 200  # Adjust position if needed
    else
        echo "Window not found. Launching new instance of Firefox."
        firefox --name "$WINDOW_ID" --class "$WINDOW_ID" &
    fi

elif [[ "$OS" == "Darwin" ]]; then
    # macOS: Check if Firefox is running
    if ! pgrep -x "Firefox" > /dev/null; then
        echo "Firefox is not running. Opening it."
        open -a "Firefox"
    else
        echo "Firefox is running. Bringing it to focus."
        osascript -e "tell application \"Firefox\" to activate"
    fi
fi
