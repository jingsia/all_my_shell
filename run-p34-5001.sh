#########################################################################
# File Name: a.sh
# Author: yangjx
# mail: jingsia@126.com
# Created Time: Tue 18 Apr 2017 03:42:56 PM CST
#########################################################################
#!/bin/bash
dir="/data/run/run-p34-5001/"
process=run-p34-5001
#pid=`netstat -tnlp |grep ":8000"|awk '{print $7}'|awk -F"/" '{print $1}'`
#kill -9 $pid
#cd $dir
#./bin/Release/Server.ASSS &
#./bin/Debug/Server.ASSS &

RETVAL=0
start() {
	echo -n "start $dir Serverpvp.Asss"
	cd $dir
	ulimit -S -c unlimited
	. run.sh   >> /dev/null 2>&1 &
	RETVAL=$?
	[ $RETVAL -eq 0 ]&&echo '[ OK ]'||echo '[ failed ]'
	echo
	pgrep $process > /data/run/admin/log/$process.pid
}                       
stop() {        
	echo -n "stop $dir Serverpvp.Asss"
	kill `cat /data/run/admin/log/$process.pid`&&echo "" >/data/run/admin/log/$process.pid
	kill `cat $dir/log/Serverpvp.pid`&&echo "" >$dir/log/Serverpvp.pid
	RETVAL=$?
	[ $RETVAL -eq 0 ]&&echo '[ OK ]'||echo '[ failed ]'
	echo 
}               
reload() {              
	echo -n "reload $dir Serverpvp.Asss"
	kill `cat $dir/log/Serverpvp.pid`
	RETVAL=$?
	[ $RETVAL -eq 0 ]&&echo '[ OK ]'
	echo
}               
case "$1" in            
	start)  
		start
		;;
	stop)
		stop
		;;
	reload) 
		reload
		;;
	restart)
		stop
		start
		;;
	*)
		echo "Usage: $0 {start|stop|restart|reload}"
		exit 1
		;;
