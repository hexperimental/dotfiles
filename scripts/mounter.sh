#!/bin/bash

# Define variables
MOUNT_POINT="~/synology"  # Change this to your desired mount point

MOUNT_OPTIONS="rw,uid=1000,gid=1000,vers=3.0"  # Change this based on your requirements

# Check if REMOTE_SHARE is set
if [ -z "$REMOTE_SHARE" ]; then
    echo "Error: REMOTE_SHARE environment variable is not set."
    echo "Please set it in your .bashrc and run 'source ~/.bashrc'"
    exit 1
fi

# Prompt user for credentials
read -p "Enter username: " USERNAME
read -s -p "Enter password: " PASSWORD
echo ""

# Create the mount point if it doesn't exist
if [ ! -d "$MOUNT_POINT" ]; then
    sudo mkdir -p "$MOUNT_POINT"
fi

# Mount the drive
sudo mount -t cifs "$REMOTE_SHARE"Documents "$MOUNT_POINT" -o username="$USERNAME",password="$PASSWORD",$MOUNT_OPTIONS



# Check if mount was successful
if [ $? -eq 0 ]; then
    echo "Drive mounted successfully at $MOUNT_POINT"
else
    echo "Failed to mount drive."
fi
