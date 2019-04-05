#!/bin/bash

LCD=$(cat /boot/armbianEnv.txt | grep -o -P "olimex-lcd-([0-9]\.[0-9]|[0-9]+)")

export DISPLAY=:0.0

FP="/etc/X11/xorg.conf.d/98-screen-calibration.conf"

echo "Section \"InputClass\"" > $FP
echo -e "Identifier \t\"calibration\"" >> $FP
echo -e "MatchProduct \"1c25000.rtp\"" >> $FP


case $LCD in
	"olimex-lcd-4.3")   echo -e "Option \t\"TransformationMatrix\" \"1.08 0.0 -0.04 0.0 1.14 -0.10 0.0 0.0 1.0\"" >> $FP ;;
	"olimex-lcd-7")   echo -e "Option \t\"TransformationMatrix\" \"1.06 0.0 -0.03 0.0 1.11 -0.08 0.0 0.0 1.0\"" >> $FP ;;
	"olimex-lcd-10")  echo -e "Option \t\"TransformationMatrix\" \"1.04 0.0 -0.03 0.0 1.09 -0.07 0.0 0.0 1.0\"" >> $FP ;;
	*) ;;
esac

echo "EndSection" >> $FP
