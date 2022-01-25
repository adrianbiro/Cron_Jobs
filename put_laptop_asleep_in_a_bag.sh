#!/bin/bash
# Nice idea by Jay LaCroix to put laptop asleep in a bag.
# Set it like cron job for 2 minutes check. The second check is to prevent suspension while the laptop is closed but in the dock.
# */2 * * * *
grep -q closed /proc/acpi/button/lid/LID/state
if [ $? = 0 ]; then
	## The laptop is closed, let's find out if it's plugged in
	grep -q 0 cat /sys/class/power_supply/AC/online
	if [ $? = 0 ]
	then
		# The laptop is not plugged in. It should be asleep.
		pm-suspend
	fi
fi





















