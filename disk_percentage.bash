#!/bin/bash
# git_source shell_fucker
# topic: disk_percentage.sh
# 用途： 让某分区达到预想占用空间
# Usage:
# disk_percentage.sh target_dir hope_percentage

function die()
{
	echo "something wrong happens,msg: "$1
}

if [[ $1 == "" -o $2 == "" -o $1 == "--help" ]];then
	die "disk_percentage.sh target_dir hope_percentage"
fi 

target_dir=$1
hope_percentage=$2

if [ ! -d $target_dir ];then
	mkdir -p $target_dir
fi

SDA_PERCENTAGE=`df . | grep -v Filesystem | grep -v 文件系统 | awk '{printf $(NF-1)}' | cut -d '%' -f 1`

# 增加比例

while [ $SDA_PERCENTAGE -lt $hope_percentage ];then
do
	dd if=/dev/zero of=$target_dir bs=1m  count=512 &>/dev/null
	#计算出现在的比例
	$SDA_PERCENTAGE=`df . | grep -v Filesystem | grep -v 文件系统 | awk '{printf $(NF-1)}' | cut -d '%' -f 1`
	echo "now SDA percentage is $SDA_PERCENTAGE"
	
done


# 减小比例  还没想出来
# 清空再填充? 不好
# 



echo "now SDA percentage is $SDA_PERCENTAGE"
