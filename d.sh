#########################################################################
# File Name: d.sh
# Author: yangjx
# mail: jingsia@126.com
# Created Time: Mon 26 Dec 2016 06:20:18 PM CST
#########################################################################
#!/bin/bash
ps -ef | grep Ser > d.txt
F=d.txt
awk '{print $2}' $F > d.txt
head $F

