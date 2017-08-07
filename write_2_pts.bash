#!/bin/bash
# Attempt to:
# 试图向登陆的用户 展示某些消息
# 展示的内容：
# cmd_top_10


# 目前只实现： 广播消息，怎么去 1. 新连接的终端 2. 发送消息
USER="root"
tmpFile=/tmp/cont.$$
cmd_top_10_easyway_2.sh > $tmpFile

if [[ `who | wc -l` -gt $default ]];then

	# 筛选出需要广播消息的用户
	devs=`who | grep $USER | awk '{print $2}'`
	for dev in $devs
	do
		cat $tmpFile > "/dev/"$dev
	done
fi

rm -rf $tmpFile
exit 0