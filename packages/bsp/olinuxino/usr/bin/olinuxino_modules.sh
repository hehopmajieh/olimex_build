#!/bin/bash

ID="/proc/device-tree/id"

case "$1" in
	start)

		# Load modules depending on board type
		case "$ID" in
			# A20-SOM204-1G
			8991)
				modprobe gpio-ir-tx r8723bs || exit $?
				;;

			# A20-SOM204-1Gs16Me16G-MC
			8958)
				modprobe gpio-ir-tx r8723bs smsc || exit $?
				;;
		esac

		# Load modules depending on lcd type
		if [[ -e '/proc/device-tree/soc@1c00000/rtp@1c25000/allwinner,ts-attached' ]]; then
			rmmod sun4i_gpadc_iio sun4i_gpadc sun4i_ts 2>/dev/null
			modprobe sun4i_ts || exit $?
		fi
	;;

	*)
		echo "Usage: $0 {start}"
		;;
esac
