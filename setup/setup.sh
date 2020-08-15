#!/bin/bash

# Dist upgrade
sudo apt-get update
sudo apt-get dist-upgrade

# Create user
adduser nib
# Add to sudoers
usermod -aG sudo nib
sudo groupadd sshusers
sudo usermod -a -G sshusers nib

# Set this in the sshd settings
echo "PermitRootLogin no"
echo "PasswordAuthentication no"
echo "Protocol 2"
echo "AllowGroups sshusers"
service sshd restart

# Install some basic things
sudo apt-get update

#Curl Tmux
sudo apt install curl tmux git pass

# Fail 2 ban
sudo apt install fail2ban
systemctl start fail2ban

#Docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce


# Change to user
su nib

# Add keys for easylogin
mkdir ~/.ssh
curl https://github.com/NiallBunting.keys >> ~/.ssh/authorized_keys

# Install dot files
mkdir me
cd me
git clone https://github.com/NiallBunting/dotfiles.git
cd ~
ln -s ~/me/dotfiles/.bashrc .
ln -s ~/me/dotfiles/.bash_profile .
ln -s me/dotfiles/.tmux.conf .
ln -s me/dotfiles/.vimrc .
ln -s me/dotfiles/.vim/ .
# These probably will need some tweaking.

# Pass setup
pass git init
pass git remote add origin user@server:~/.password-store
gpg --import pubkey.asc
gpg --allow-secret-key-import --import privkey.asc

# Set up firewall
sudo ufw allow ssh
sudo ufw enable
