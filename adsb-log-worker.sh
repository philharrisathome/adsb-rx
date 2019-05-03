#!/bin/sh
# Expects:
#	$1	Host IP and port (e.g. http://localhost:30003)
#	$2	Message filter regex (e.g. 'MSG,[134],')
#	$3	Output filename
wget -O - -q $1 | grep $2 > $3 
gzip $3
