#!/bin/bash

ID="/proc/device-tree/id"

case "$1" in
	start)
		case "$ID" in
			# A20-SOM204-1G
			8991)
				modprobe gpio-ir-tx r8723bs
				exit $?
				;;

			# A20-SOM204-1Gs16Me16G-MC
			8958)
				modprobe gpio-ir-tx r8723bs smsc
				exit $?
				;;
		esac
	;;

	stop)
		case "$ID" in
			# A20-SOM204-1G
			8991)
				rmmod gpio-ir-tx r8723bs
				exit $?
				;;
			# A20-SOM204-1Gs16Me16G-MC
			8958)
				rmmod gpio-ir-tx r8723bs smsc
				exit $?
				;;
		esac
		;;

	*)
		echo "Usage: $0 {start|stop}"
		;;
esac
