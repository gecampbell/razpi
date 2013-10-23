#!/bin/bash
#
# This script saves a copy of the current network configuration
# to a file, and then writes that file to a remote destination.
# This is useful if you connect to a network and don't know the
# IP address of your Pi.

TMPFILE=/tmp/$HOSTNAME-$0.TMP

if [ "$1" == "" ]; then
	echo Error: no destination specified
	echo Example:
	echo $0 fred@someplace.org:./cool
	exit
fi

# store the configuration data here
date > $TMPFILE
echo --- >> $TMPFILE
ifconfig -a >> $TMPFILE

# copy it to the remote location
scp $TMPFILE $1
