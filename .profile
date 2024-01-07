# This file is not read by bash, if ~/.bash_profile or ~/bash_login exist.
# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if exist
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    else if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
    fi
fi

# add to PATH the privat bin if exist
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin":$PATH"
fi

fi [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin":$PATH"
fi