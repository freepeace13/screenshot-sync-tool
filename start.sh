#!/bin/bash

# FTPSYNC VARIABLES
# This must be changed according to data given
HOST=''
USER=''
PASS=''
TARGETFOLDER=''
SOURCEFOLDER=''

while true; do
  echo "Waiting to capture...";

  scrot -d 30 -q 40 '%Y-%m-%d %H:%M:%S.png' -e 'mv $f ./captured';

  lftp -e "
  open $HOST
  user $USER $PASS
  lcd $SOURCEFOLDER
  mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
  bye
  "
done