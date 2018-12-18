#!/bin/bash

ID="/proc/device-tree/id"

case "$1" in
	start)
		# Check is board is A20-SOM204 EVB
		case "$ID" in
			# A20-SOM204-1G | A20-SOM204-1Gs16Me16G-MC
			8991|\
			8958)
				rtk_hciattach -n -s 115200 /dev/ttyS1 rtk_h5
				exit $?
			;;
		esac
	;;

	stop)
		killall -q -SIGTERM rtk_hciattach
		exit 0
	;;

	*)
		echo "Usage: $0 {start|stop}"
		;;
esac
