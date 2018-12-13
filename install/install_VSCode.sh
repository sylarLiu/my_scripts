#! /usr/bin/env bash

# Install Ubuntu make
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make

# Install Visual Studio Code
umake ide visual-studio-code
