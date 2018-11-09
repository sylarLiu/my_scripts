#! /usr/bin/env bash

#================================================================
#   Copyright (C) 2018 . All rights reserved.
#   
#   File Name    ： network.sh
#   Author       ： sylar.liu
#   E-mail       ： sylar_liu65@163.com
#   Created Time ： 2018/11/09 08:17:04
#   Description  ： 
#
#================================================================

# check the format of a Ip address
# return: 0 - legal, 1 - illegal
CheckIp()
{
  if [[ "$1" =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
		return 0
	else
	  	return 1
	fi
}

# Check the format of a Netmask
# return: 0 - legal, 1 - illegal
CheckNetmask()
{
  if [[ "$1" =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
		return 0
	else
	  	return 1
	fi
}

