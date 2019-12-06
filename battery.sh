#!/bin/bash

i3status | while :
do
	read line
	battery=`acpi | awk '{print $3 $4}' <(acpi)`
	backlight=`xbacklight -get | awk '{printf("%d\n", $0+0.5)}'`
	echo "🔋$battery | 💡$backlight% | $line" || exit 1
done
