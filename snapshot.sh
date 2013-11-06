#!/bin/bash

# Simple script that takes a full-sized snapshot and uploads it to 
# my Flickr photostream. Requires token, secret on the
# command line. 

# load data
FILENAME=IMG_`date +%Y%m%d%H%M%S`.jpg
QUALITY=90
# sharpness -100 to +100
SHARPNESS=20
. ~/.flickrrc # define credentials

echo `date` Starting $0

# take the picture
echo `date` taking the picture
raspistill \
	-q $QUALITY \
	-sh $SHARPNESS \
	-o $FILENAME

# upload
echo `date` uploading to Flickr
flickr_upload \
	--auth_token $FLICKR_TOKEN \
	--key $FLICKR_KEY \
	--secret $FLICKR_SECRET \
	--family 0 \
	--public 0 \
	--tag='RazSnapBig' \
	$FILENAME

# clean up
echo `date` cleaning up
rm $FILENAME

echo `date` done
