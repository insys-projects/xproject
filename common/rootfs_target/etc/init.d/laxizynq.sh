#!/bin/sh
#
# load axidrv
#

# Make sure the axidrv.ko exists
[ -f /home/embedded/drivers/axidrv.ko ] || exit 0

mname=axidrv
device=axidrv
mode="666"

mknodes() {
	devfiles=`ls /dev/fmc130* | grep fmc130`
	chmod 666 ${devfiles}
}
start() {
	printf "Starting axidrv: "
	/sbin/insmod /home/embedded/drivers/axidrv.ko || exit 1
	echo "OK"
	mknodes
}
stop() {
	printf "Stopping axidrv: "
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
