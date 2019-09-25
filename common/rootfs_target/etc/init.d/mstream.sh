#!/bin/sh
#
# isvi server start.
#

# Make sure the progam exists
[ -f /run/media/mmcblk0p1/mstream ] || exit 0

start() {
	printf "Starting mstream: "
	/run/media/mmcblk0p1/mstream &
	touch /var/lock/mstream
	echo "OK"
}
stop() {
	printf "Stopping mstream: "
	killall mstream
	rm -f /var/lock/mstream
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
