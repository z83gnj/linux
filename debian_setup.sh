#! /bin/bash
# Define the username for who will install the . files
USRNAME="matakos"
HOMEDIR=$(eval echo ~$USRNAME)

# Create a tmp folder
TEMP_DIR=$(mktemp -d)

apt-get install gnome-core -y
apt-get gpg -y

# Install Google Chrome
wget -qnv --show-progress -O ${TEMP_DIR}/google-chrome-stable_current_amd64.deb  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
apt-get install ${TEMP_DIR}/google-chrome-stable_current_amd64.deb -y

# Install Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt-get update && apt-get install code -y

# Install LibreOffice
apt-get install libreoffice -y
apt-get install terminator -y

# grub background titus
#git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
#cd Top-5-Bootloader-Themes
#sudo ./install.sh

# Remove tmp folder
rm -r $TEMP_DIR

# Replace the default .bashrc 
su $mv ~/.bashrc default.bashrc -f
cp .bashrc ~/ -f