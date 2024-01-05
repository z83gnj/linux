#! /bin/bash

apt-get install gnome-core -y

# Replace the default .bashrc 
mv ~/.bashrc default.bashrc
cp .bashrc ~/ -y

# Create a tmp folder
TEMP_DIR=$(mktemp -d)

# Install Google Chrome
wget -qnv --show-progress -O ${TEMP_DIR}/google-chrome-stable_current_amd64.deb  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
apt-get install ${TEMP_DIR}/google-chrome-stable_current_amd64.deb

# Install Visual Studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - 
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get update && apt-get install code -y

# Install LibreOffice
apt install libreoffice -y

# Remove tmp folder
rm -r $TEMP_DIR


  

 
 