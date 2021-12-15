#!/bin/sh

#killall script-notify-low-bat.sh

while true; do
	batcap=$(cat /sys/class/power_supply/BAT0/capacity)
	if [ $batcap -gt 50 ] ; then
  	sleep 1200
  elif [ $batcap -gt 15 ] ; then
  	sleep 300
  else
  	/usr/bin/notify-send "battery is $batcap"
  	sleep 120
	fi
done
