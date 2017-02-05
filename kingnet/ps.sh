#!/bin/bash
source ser.sh

now=`date +%Y-%m-%d`

if [ ! -f .date ]; then
	echo `date +%Y-%m-%d` > .date
fi

date=`cat .date`
if [ "$date" != "$now" ]; then
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

src=~/asss
dst=sscq

if [ ! -d $src ]; then
	echo "$src is not exist!"
	exit -1
fi

if [ "$1" == "" ]; then
	dstname=$dst-`date +%Y%m%d`
else
	dstname=$dst-$1-`date +%Y%m%d`
fi

if [ -d $dstname ]; then
	rm -rf $dstname
fi

cp -rf $src $dstname
echo test...............
cd $dstname
rm *.txt TAGS t cscope.* t.sh core.* *.txt
rm -rf obj log  reports/ bin build/
rm -rf .git
find . -name .svn | xargs rm -rf
cd ..
tar cvfz $dstname-$num.tgz $dstname

num=`expr $num + 1`
echo $num > .num
