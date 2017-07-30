#!/bin/bash

# 自动检测是否还在加班
# 目前这种方式不太适用 

if ! who | grep -wq $USER; then
  exit
fi

# 通讯变量
HERNUMBER="+xxxx"
MYNUMBER="+ZZZZZ"
PaaSAPI="http://xxx.api.com/sendmsg/"

# MSG
REASONS=(
	"项目加班"
	"该死的老板又叫我们加班"
	"项目聚餐，晚点回去"
)

# RANDON REASON
idx=$(( $RANDOM % ${#REASONS[@]} ))
MESSAGE=${REASONS[$idx]}

# send a msg
RESPONSE=`curl -fSs -u "$ACCOUNT:$AUTH_TOKEN" -d "from=$MYNUMBER" -d "to=$HERNUMBER" -d "body=$MESSAGE" $PaaSAPI`

if [ $? -ne 0 ];then
	echo "fail to send msg : $RESPONCE"
	exit 1
fi
