#########################################################################
# File Name: a.sh
# Author: yangjx
# mail: jingsia@126.com
# Created Time: Mon 23 Jan 2017 02:16:21 AM CST
#########################################################################
#kill进程
#!/bin/bash
ps -ef | grep Ser > 1
F=1
awk '{print $2}' $F > 2
F2=2
while read line
do
	echo $line
	kill -9 $line
done < $F2
