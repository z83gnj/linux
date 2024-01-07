#! /bin/bash

# Purge someeval bloatware
xargs -a bloatware.txt sudo apt autopurge -y


# Create a tmp folder
TEMP_DIR=$(mktemp -d)

sudo apt-get gpg -y

# Install Google Chrome
. "$PWD/install_chrome.sh"

# Install Visual Studio Code
. "$PWD/install_VScode.sh"

# Install additional sofwtare
xargs -a add_app.txt sudo apt-get install -y

# grub background titus
#git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
#cd Top-5-Bootloader-Themes
#sudo ./install.sh

# Remove tmp folder
rm -r $TEMP_DIR

# Replace the default .bashrc .bash_profile .bash_login .profile
mv $HOMEDIR/.bashrc default.bashrc -f
cp .bashrc $HOMEDIR/ -f

