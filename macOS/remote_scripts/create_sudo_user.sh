#!/usr/bin/env bash

USER=${1?ERROR: No user name given}

# adding the user to sudo group
adduser $USER
usermod -aG sudo $USER

# installing UFW 
apt update
apt upgrade
apt install ufw

# setting up and enabling the UFW
ufw allow OpenSSH
ufw enable

# copy the public key
rsync --archive --chown=$USER:$USER ~/.ssh /home/$USER

