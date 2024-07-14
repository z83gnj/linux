############################################
# User input
# Please add username and folder to 
# the transmission settings file and the 
# smb.conf before running the script
############################################

PATH_OF_SMB_SHARE=/path/to/folder
SMB_USER=akos

############################################
# Start of the script
############################################
sudo apt insatll samba -y

sudo useradd -M -N "$SMB_USER" # user for smb share
sudo groupadd smb # create group for smb share
sudo usermod -g smb "$SMB_USER"  #change user primary group
# Permission for the smb share
sudo chown -R "$SMB_USER":smb "$PATH_OF_SMB_SHARE"

sudo smbpasswd -a "$SMB_USER" # set password for smb share

sudo mv -f /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cp -f ./Settings_files/smb.conf /etc/samba/smb.conf
testparm

sudo systemctl restart smbd

apt install transmission-daemon -y
sudo systemctl stop transmission-daemon

sudo usermod -g smb debian-transmission
sudo usermod -aG debian-transmission debian-transmission

sudo cp -f ./Settings_Files/setting.json /etc/transmission-daemon/setting.json

sudo systemctl start transmission-daemon
