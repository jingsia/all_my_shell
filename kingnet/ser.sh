#!/bin/bash

function num()
{
	now=`date +%Y-%m-%d`

	if [ ! -f .date ]; then
		echo `date +%Y-%m-%d` > .date
	fi
	date=`cat .date`
	if [ "$date" != "$now"]; then
		echo "1" > .num
		date=$now
		echo $date > .date
	fi

	if [ ! -f .num ]; then
		echo "1" > .num
	fi
	num=`cat .num`
	if [ "$num" == "0" ]; then
		num=1
	fi
	if [ "$num" == "" ]; then
		num=1
	fi

	ret=num

	num=`expr $num + 1`
	echo $num > .num

	export ser
}
