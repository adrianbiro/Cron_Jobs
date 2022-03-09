#!/bin/bash

# The rationale behind this is to keep track of frequently used commands.
# TODO Since lack of options in the original one-liner in crontab, it will be moved to a simple type of service in systemd timer.
#TODO redo
# correct result depends on shopt -s histappend bash built-in commands, see bash(1)
# Since pipes create a subshell, it is necessary to source this script, like this . hstat
#history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head

history \
  | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' \
  | sort \
  | uniq -c \
  | sort -nr \
  | head > file.txt			#TODO see loging

# TODO put monthly reports to a tar archive in $backdir
#tar -rf monthly_bash_hstats.tar
#m_statname="$(echo ${USER^}"$(date +'%Y-%m-%d')").stat"

#TODO error handler
#err() {
#  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
#}
#TODO redo with systemd journal

#TODO change log file and errorlog
#TODO parse log file for month stats

#TODO Unit file hstat.service hstat.timer
# use ~/.config/systemd/user/ OR /etc/systemd/system/
#TODO use monotonic timers
