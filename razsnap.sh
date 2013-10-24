#!/bin/bash

# Simple script that takes a snapshot and uploads it to 
# my Flickr photostream. Requires token, secret on the
# command line. 

# take the picture
FILENAME=/tmp/IMG_`date +%Y%m%d%H%M%S`.jpg
raspistill -q 80 -o $FILENAME

# upload
# load credentials
. ~/.flickrrc
flickr_upload \
	--auth_token $FLICKR_TOKEN \
	--key $FLICKR_KEY \
	--secret $FLICKR_SECRET \
	--family 1 \
	--tag='RazSnap' \
	$FILENAME

# clean up
rm $FILENAME
