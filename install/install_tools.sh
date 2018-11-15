#! /usr/bin/env bash

# Install chrome
if [ ! -f /etc/apt/sources.list.d/google-chrome.list ]; then
	wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
fi
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
apt-get update
apt-get install google-chrome-stable -y

# Install termintor
apt-get install terminator -y

# Install shutter
apt-get install shutter -y

# Install vim
apt-get install vim -y

# Install Git
apt-get install git gitk -y

# Install meld
apt-get install meld -y

apt-get install fcitx -y
