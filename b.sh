#!/bin/bash

F=a.txt
F2=b.txt

if [ "$1" != "" ]
then
	F=$1
fi

function b_up()
{
	f=$1
	echo $f
	echo $2

	if [ $? -eq 0 ]
	then
		echo "OK"
	else
		echo "ERROR"
	fi
}

if [ -f $F ]
then
	b_up $F $F2
else
	echo "file $F is not exists"
fi
