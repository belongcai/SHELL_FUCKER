#!/bin/bash
# Usage: list top 10 command of the bash history
# from ~/.bash_history

# for's way
declare -A CmdArray
old=$IFS
IFS=$'\n'

for cmd in `cat ~/.bash_history`
do
	echo "cmd now is $cmd" >> /tmp/b.txt
	if [[ "e"${CmdArray[$cmd]} != "e" ]];then
		let CmdArray[$cmd]++
			
	else
		CmdArray[$cmd]=1
	fi

done

echo "" > /tmp/a.txt

for key in ${!CmdArray[@]}
do
	printf "%60s\t%d\n" $key ${CmdArray[$key]} >> /tmp/a.txt  

done

cat /tmp/a.txt | sort -t $'\t' -nrk 2 | head -10
