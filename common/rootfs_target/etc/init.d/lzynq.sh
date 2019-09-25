#!/bin/sh
#
# load ambpex
#

# Make sure the ambpex.ko exists
[ -f /home/embedded/drivers/lzynq.ko ] || exit 0

mname=lzynq
device=lzynq
mode="666"

mknodes() {
	str=`cat /proc/devices | grep $mname`
	major=`expr match "$str" '\([0-9]*\)'`
	echo Driver ${module} was loaded. Major number: ${major}.
#	mknod /dev/${device}0 c ${major} 0
	chmod -v ${mode} /dev/${device}0
}
start() {
	printf "Starting lzynq: "
	/sbin/insmod /home/embedded/drivers/lzynq.ko dbg_trace=0 err_trace=1 || exit 1
	echo "OK"
	mknodes
}
stop() {
	printf "Stopping lzynq: "
	/sbin/rmmod ${mname}
	echo "OK"
}
restart() {
	stop
	start
}

case "$1" in
  start)
	start
	;;
  stop)
	stop
	;;
  restart|reload)
	restart
	;;
  *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?
