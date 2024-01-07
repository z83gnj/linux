#! /bin/bash

# Purge someeval bloatware
xargs -a bloatware.txt sudo apt autopurge -y

sudo apt autoclean

#gsettings set org.gnome.shell app-picker-layout "[]"