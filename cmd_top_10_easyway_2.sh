#!/bin/bash
#cmd_top_10_easyway.sh
# 直接对 $1 也就是命令本身统计
 
printf "%80s\t%10s\n" "曾经使用过的命令" "次数"

cat ~/.bash_history | awk -F '\n' '{list[$1]++}\
END{
	for( i in list )
		{
			printf("%80s\t%10d\n",i,list[i]);
		}

}' | sort -t $'\t'  -nrk 2 | head -10  