#!/bin/bash

# Simple script that takes a snapshot and uploads it to 
# my Flickr photostream. Requires token, secret on the
# command line. 

# load data
FILENAME=/tmp/IMG_`date +%Y%m%d%H%M%S`.jpg
QUALITY=70
# max width=2492 height=1944
WIDTH=640
HEIGHT=480
. ~/.flickrrc # define credentials

echo `date` Starting $0

# take the picture
echo `date` taking the picture
raspistill \
	-q $QUALITY \
	-w $WIDTH \
	-h $HEIGHT \
	-o $FILENAME

# upload
echo `date` uploading to Flickr
flickr_upload \
	--auth_token $FLICKR_TOKEN \
	--key $FLICKR_KEY \
	--secret $FLICKR_SECRET \
	--family 0 \
	--public 0 \
	--tag='RazSnap' \
	$FILENAME

# clean up
echo `date` cleaning up
rm $FILENAME

echo `date` done
