#!/bin/bash

# Replace eth0 with your network interface
INTERFACE="eth0"

# Release the current IP address
sudo dhclient -r $INTERFACE

# Renew the IP address
sudo dhclient $INTERFACE

echo "IP address renewed for $INTERFACE"
