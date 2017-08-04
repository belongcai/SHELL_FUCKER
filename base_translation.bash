#!/bin/bash
# learn the base translatiion from cymurus

# base(8,16,32,64)#number to base#10
echo $((16#num))

# base#10 to base(8,16,32,64)#number 
echo "obase=$base;$num" | bc

