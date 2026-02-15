#!/bin/bash

# Configuration
# parameters to not run them again. 
PATCH_DIR="$HOME/Projects/tradablebits/sql"
PATCH_PATTERN="patch*.sql"
TRACK_FILE="$HOME/junk/applied_patches_log.txt"

DB_NAME="your_database"  # Replace with your actual database name
DB_USER="your_user"  # Replace with your actual database user

# Ensure tracking file exists
mkdir -p "$(dirname "$TRACK_FILE")"
touch "$TRACK_FILE"

# Get the list of applied patches
APPLIED_PATCHES=$(cat "$TRACK_FILE")

# Find all patch files
for PATCH in $(ls $PATCH_DIR/$PATCH_PATTERN 2>/dev/null | sort); do
    echo "Running patch"$PATCH
    # Check if the patch was already applied
    if grep -Fxq "$PATCH" "$TRACK_FILE"; then
        echo "Skipping already applied patch: $PATCH"
    else
        echo "Applying new patch: $PATCH"

        # Run a patch file on the local database
        psql -U toggleme -h 127.0.0.1 -f $PATCH

        if [ $? -eq 0 ]; then
            echo "$PATCH" >> "$TRACK_FILE"
        else
            echo "Error applying patch: $PATCH"
            exit 1
        fi
    fi
done

echo "All patches applied successfully."
