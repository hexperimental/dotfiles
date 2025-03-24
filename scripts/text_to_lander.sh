#!/bin/bash


OS="$(uname -s)"
TEXT_LANDER_PATH='Notes/FieldNotes/Logbook.md'
SAVE_PATH="${TEXT_SAVE_PATH:-$HOME/$TEXT_LANDER_PATH}"

save_text_linux() {

    if [ "$#" -eq 0 ]; then
        text=$(zenity --text-info --editable --title="Save Text" --width=500 --height=400)
    else
        text="$*"
    fi

    if [ -n "$text" ]; then
        timestamp=$(date --iso-8601=seconds)
        temp_file=$(mktemp)
        printf "**%s**\n%s\n\n" "$timestamp" "$text" > "$temp_file"
        cat "$SAVE_PATH" >> "$temp_file" 2>/dev/null
        mv "$temp_file" "$SAVE_PATH"
        notify-send "Text saved!" "Prepended to $SAVE_PATH"
    fi
}

save_text_macos() {
    text=$(osascript -e 'tell application "System Events"
        set userInput to text returned of (display dialog "Enter your text:" default answer "" buttons {"Save"} default button "Save")
    end tell')
    if [ -n "$text" ]; then
        timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
        temp_file=$(mktemp)
        printf "**%s**\n%s\n\n" "$timestamp" "$text" > "$temp_file"
        cat "$SAVE_PATH" >> "$temp_file" 2>/dev/null
        mv "$temp_file" "$SAVE_PATH"
        osascript -e "display notification \"Text saved!\" with title \"Note Saved\" subtitle \"Prepended to $SAVE_PATH\""
    fi
}
#
# Run the appropriate function based on OS
if [[ "$OS" == "Linux" ]]; then
    save_text_linux
elif [[ "$OS" == "Darwin" ]]; then
    save_text_macos
else
    echo "Unsupported OS: $OS"
    exit 1
fi
