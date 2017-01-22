#########################################################################
# File Name: fi.sh
# Author: yangjx
# mail: jingsia@126.com
# Created Time: Mon 26 Dec 2016 10:27:41 AM CST
#########################################################################
#!/bin/bash

F=TRACE20161215
F1=1.txt

function first()
{
	awk -F ']' '{print($3)}' $F | awk -F '[' '{print($2)}' > $F1
}

if [ -f $F ]
then
	first
else
	echo "not exist"
fi

