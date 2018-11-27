#! /usr/bin/env bash

#================================================================
#   Copyright (C) 2018 . All rights reserved.
#   
#   File Name    ： install_sublimetext.sh
#   Author       ： sylar.liu
#   E-mail       ： sylar_liu65@163.com
#   Created Time ： 2018/11/16 10:00:06
#   Description  ： 
#
#================================================================

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

sudo apt-get install apt-transport-https

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update

sudo apt-get install sublime-text
