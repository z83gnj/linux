# This file is not read by bash, if ~/.bash_profile or ~/bash_login exist.
# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if exist
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
