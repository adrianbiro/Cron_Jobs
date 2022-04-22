#!/usr/bin/python3
import psutil

"""If a non-default location is used, it will find it."""
for i in psutil.disk_partitions():
	for j in i:
		if "timeshift" in str(j):
			timeshift_path = j

disk = psutil.disk_usage(timeshift_path)
total_80 = (disk.total / 100) * 80
free = disk.free
free_space = round(free / (2**30))
msg = f"Free space just {free_space}.GB"
if free > total_80:
    import subprocess
    subprocess.run(["notify-send", "--urgency=normal", msg])


