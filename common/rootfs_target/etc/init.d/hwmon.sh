#!/bin/sh
#
# isvi server start.
#

# Make sure the progam exists
[ -f /run/media/mmcblk0p1/hwmon ] || exit 0

start() {
	printf "Starting hwmon: "
	/run/media/mmcblk0p1/hwmon &
	touch /var/lock/hwmon
	echo "OK"
}
stop() {
	printf "Stopping hwmon: "
	killall hwmon
	rm -f /var/lock/hwmon
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
