#!/bin/bash
# ${var%.*} 从右往左匹配
# ${var#*.} 从左边往右边匹配

# give a example
var="hack.fun.book.jpg"

echo ${var%.*} # hack.fun.book
echo ${var%%.*} # hack

echo ${var#*.} # fun.book.jpg
echo ${var##*.} # jpg
