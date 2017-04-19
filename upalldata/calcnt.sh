#########################################################################
# File Name: x.sh
# Author: yangjx
# mail: jingsia@126.com
# Created Time: Wed 19 Apr 2017 03:53:39 PM CST
#########################################################################
#!/bin/bash
export U=root
export P=TD9HwjXkIT0lGbc
#d=/data/test/dbsdata3
d=/data/test/dbs.all
#d=dbsDel
NAME1="xxxxx"
NAME2="yyyyy"

export C="select *,from_unixtime(over) from gvar where id = 65;"

awk '{
	{
		print($1);
		system("mysql -u" "'$U'" " -p" "'$P'" " " $2 " " $3 " " $4 " -n -e " "\"" "'"$C"'" "\"");
	}
}' $d
