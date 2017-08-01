#!/bin/bash
# 制造制定大小的文件
# use dd

dd --help
dd if=/dev/zero bs=10k count=1 of=/tmp/data.file


# 分割 制定单位  的文件 
# use split
echo "++++++++++++++"
split --help
split -b 1k /tmp/data.file -d -a 4 分割

# 分割 指定行数 的文件
# use -l no_of_lines
# split -l 10 data.file 

ls -lh /tmp
