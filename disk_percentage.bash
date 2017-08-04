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

if [ ! -f $target_dir/attach ];then
	mkdir -p $target_dir/attach
fi
ATTACH="$target_dir/attach"
SDA_PERCENTAGE=`df $target_dir | grep -v Filesystem | grep -v 文件系统 | awk '{printf $(NF-1)}' | cut -d '%' -f 1`

# 复制块数字
block=1
# 增加比例

while [ $SDA_PERCENTAGE -lt $hope_percentage ];then
do
	if [ -f $ATTACH/test.$block ];then
		dd if=/dev/zero of=$ATTACH/test.$block bs=1m  count=512 &>/dev/null
		echo "add file $ATTACH/test.$block"
		#计算出现在的比例
		$SDA_PERCENTAGE=`df $target_dir | grep -v Filesystem | grep -v 文件系统 | awk '{printf $(NF-1)}' | cut -d '%' -f 1`
		echo "now SDA percentage is $SDA_PERCENTAGE"
	fi
	let block++
done


# 减小比例  还没想出来
# 清空再填充? 不好
# now only for used target_dir

while [ $SDA_PERCENTAGE -gt $hope_percentage ];then
do
	if [ -f $ATTACH/test.$block ];then
		rm -rf $ATTACH/test.$block
		echo "delete file $ATTACH/test.$block"
		#计算出现在的比例
		$SDA_PERCENTAGE=`df $target_dir | grep -v Filesystem | grep -v 文件系统 | awk '{printf $(NF-1)}' | cut -d '%' -f 1`
		echo "now SDA percentage is $SDA_PERCENTAGE"
	fi
	let block++
done


echo "now SDA percentage is $SDA_PERCENTAGE"
