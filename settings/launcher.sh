#! /usr/bin/env bash

#================================================================
#   Copyright (C) 2018 . All rights reserved.
#   
#   File Name    ： launcher.sh
#   Author       ： sylar.liu
#   E-mail       ： sylar_liu65@163.com
#   Created Time ： 2018/11/15 17:05:14
#   Description  ： 
#
#================================================================

case $1 in
  	(left):
	  	gsettings set com.canonical.Unity.Launcher launcher-position Left
		;;
	(bottom):
		gsettings set com.canonical.Unity.Launcher launcher-position Bottom
		;;
	(*):
	  	echo "Usage: launcher <left | bottom>"
esac
