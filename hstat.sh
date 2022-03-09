#!/bin/bash

#TODO redo
# correct result depends on shopt -s histappend bash built-in commands, see bash(1)


#history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head

history \
| awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' \
| sort \
| uniq -c \
| sort -nr \
| head)




#TODO error handler
#err() {
#  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
#}

#TODO change log file and errorlog
