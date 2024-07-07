sudo apt insatll samba -y

sudo useradd -M -N akos # user for smb share
sudo groupadd smb # create group for smb share
sudo usermod -g smb akos  #change user primary group
sudo smbpasswd -a akos # set password for smb share

sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.bak

sudo cat << EOF >> /etc/samba/smb.conf
[global]
    workgroup = WORKGROUP
    log file = /var/log/samba/log.%m
    max log size = 10000
    logging = file
    server role = standalone server
    unix password sync = yes
    passwd program = /usr/bin/passwd %u
    passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .

[TorrentDown]
    commanet = Torrent downloads
    path = /mnt/torrent/
    valid users = akos
    read only = no

EOF

testparm

sudo systemctl restart smbd