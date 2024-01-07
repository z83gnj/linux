#! /bin/bash
wget -qnv --show-progress -O ${TEMP_DIR}/google-chrome-stable_current_amd64.deb  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt-get install ${TEMP_DIR}/google-chrome-stable_current_amd64.deb -y