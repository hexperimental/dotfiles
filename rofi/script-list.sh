#!/bin/bash

SCRIPT_DIR="$HOME/dotfiles/scripts/work"

# If no argument is passed, list all executable scripts
if [[ -z "$@" ]]; then
    # Output all scripts as options
    find "$SCRIPT_DIR" -maxdepth 1 -type f -executable -printf "%f\n"
    exit 0
fi

# If a script is selected, execute it
SCRIPT_NAME="$1"
shift  # Remove the script name from arguments

# Run the selected script with parameters
coproc ( "$SCRIPT_DIR/$SCRIPT_NAME" "$@" > /dev/null 2>&1 & )
exit 0
