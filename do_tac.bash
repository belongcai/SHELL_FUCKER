#!/bin/bash
# use tac
# use awk
# use sort
# achieve to convert lines

seq 9 | tac

echo "**************"

seq 9 | \
	awk '
	{ 
	line[NR] = $0
	lno=NR 
	}
	END{
		for(;lno>0;lno--)
		{
			print line[lno]
		}
	}'
