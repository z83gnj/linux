#!/bin/bash

# Path to the file that stores the last update check date
LAST_UPDATE_FILE="$HOME/.last_update_check"

# Get today's date
TODAY=$(date +%Y-%m-%d)

# Function to check for updates
check_updates() {
    echo "Checking for updatable packages..."

    # Count upgradable packages
    upgradable=$(apt list --upgradable 2>/dev/null | grep -v "Listing" | wc -l)

    # Count security updates
    security_updates=$(apt list --upgradable 2>/dev/null | grep -v "Listing" | grep -i "security" | wc -l)

    if [ "$upgradable" -gt 0 ]; then
        echo "$upgradable packages can be updated."
        if [ "$security_updates" -gt 0 ]; then
            echo "$security_updates updates are security updates."
        fi
        echo "Run 'sudo apt upgrade' to update them."
    else
        echo "All packages are up to date."
    fi
}

# Check if the last update check date file exists
if [ ! -f "$LAST_UPDATE_FILE" ]; then
    # If the file does not exist, create it with today's date and check for updates
    echo "$TODAY" > "$LAST_UPDATE_FILE"
    check_updates
else
    # Read the last update check date
    LAST_UPDATE=$(cat "$LAST_UPDATE_FILE")

    # Compare the last update check date with today's date
    if [ "$LAST_UPDATE" != "$TODAY" ]; then
        # If the dates are different, update the file with today's date and check for updates
        echo "$TODAY" > "$LAST_UPDATE_FILE"
        check_updates
    fi
fi
