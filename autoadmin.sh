#!/bin/bash
# TODO:Write thing

echo "Validate sudo credentials ..."
sudo -v

#Updating Package List and Upgrading them
sudo apt-get update
sudo apt-get dist-upgrade -y

#Clear apt cache
sudo apt-get autoclean -y
sudo apt-get autoremove -y