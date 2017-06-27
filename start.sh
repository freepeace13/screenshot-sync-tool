#!/bin/bash

# FTPSYNC VARIABLES
# This must be changed according to data given
HOST=''
USER=''
PASS=''
TARGETFOLDER=''
SOURCEFOLDER=''
IMAGEQUALITY=40
INTERVAL=60


while true; do
  echo "Waiting to capture...";

  scrot -d $INTERVAL -q $IMAGEQUALITY '%Y-%m-%d-%H:%M:%S.png' -e 'mv $f ./captured';

  lftp -e "
  open $HOST
  user $USER $PASS
  lcd $SOURCEFOLDER
  mirror --reverse --verbose $SOURCEFOLDER $TARGETFOLDER
  bye
  "
done