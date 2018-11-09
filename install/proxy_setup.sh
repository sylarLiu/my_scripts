#! /usr/bin/env bash
#===============================================================================
#
#          FILE: proxy_setup.sh
#
#         USAGE: 
#				start terminal proxy: 
#					source /usr/local/etc/proxy/start_terminal_proxy
#				stop  terminal proxy: 
#					source /usr/local/etc/proxy/stop_terminal_proxy
#
#        AUTHOR: sylar.liu
#       CREATED: 2018年11月03日 14时31分03秒
#===============================================================================

apt-get update
apt-get install shadowsocks -y
apt-get install privoxy -y

prefix="/usr/local/etc/proxy"
if [ ! -d ${prefix} ]
then 
  	mkdir ${prefix}
fi

# shadowsocks setting
# 安装后, 需要填写代理服务器连接密码
config="${prefix}/shadowsocks.json"
echo '
{
	"server": "45.76.28.221",  
	"server_port": 8989, 
	"local_address": "127.0.0.1", 
	"local_port": 1080, 
	"password": "", 
	"method": "aes-256-cfb", 
	"fast_open": true, 
	"workers": 1
}
' > ${config}
read -p "Ener proxy server connection password or input it later in ${config}: " passwd
sed -i "/password:*/c\    \"password\": \"${passwd}\"," ${config}

# 启动时自动启动shadowsocks
if [ -z "$(sed -n '/^sslocal -c/p' '/etc/rc.local')" ]
then
	sed -i "/^exit 0/i\sslocal -c ${config} &\n" /etc/rc.local
else
  	sed -i "/^sslocal -c*/c\sslocal -c ${config} &" /etc/rc.local
fi

# 自动修改/etc/privoxy/config
if [ -z "$(sed -n '/^forward-socks5 \/ 127.0.0.1:1080/p' '/etc/privoxy/config')" ]
then
	sed -in '1365iforward-socks5 \/ 127.0.0.1:1080 .' '/etc/privoxy/config'
fi

# 启动时自动启动privoxy
if [ -z "$(sed -n '/^\/etc\/init.d\/privoxy start/p' '/etc/rc.local')" ]
then
  	sed -i "/^exit 0/i\/etc\/init.d\/privoxy start\n" "/etc/rc.local"
fi

# 生成终端代理启动文件
echo '#! /usr/bin/env bash

export http_proxy="127.0.0.1:8118"
export https_proxy="127.0.0.1:8118"
' > "${prefix}/start_terminal_proxy"

# 生成终端代理停止文件
echo '#! /usr/bin/env bash

export http_proxy=""
export https_proxy=""
' > "${prefix}/stop_terminal_proxy"

