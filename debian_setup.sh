#! /bin/bash

apt-get install gnome-core

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

# Install PowerShell
# sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list' 
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main"
apt-get update && apt-get install powershell -y


# Remove tmp folder
rm -r $TEMP_DIR


  

 
 