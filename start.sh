#!/bin/bash

# FTPSYNC VARIABLES
# This must be changed according to data given
#HOST='sftp://techire.vps.platon.sk'
HOST='ftp://192.168.254.102'
#USER='kbasco_test'
#USER='techire_test'
USER='kinbasco'
#PASS='tyreatdygnifNu'
#PASS='ewgolt0KnilCal'
PASS='mu899Mfer7'
#TARGETFOLDER='/storage/techire/cs.techire.eu/public/images/screenshots/freepeace13@gmail.com'
#TARGETFOLDER='/storage/techire/cs.techire.eu/public/images/screenshots/tester@techire.eu'
TARGETFOLDER='/home/kinbasco/Desktop/Code/techire-backend/public/images/screenshots/kin.basco@gmail.com'
SOURCEFOLDER='~/Desktop/SyncTool/captured'
SITE='http://techire.app'

# SCREENSHOT VARIABLES
# Change `http://techire.app` with the actual domain
# SERVERDATE=`curl -s "$SITE/ajax/time/get-server-datetime" | jq '.unixDateFormat'`;

# tmp="${SERVERDATE%\"}";
# SERVERDATE="${tmp#\"}";
# IFS='-' read -r -a array <<< $SERVERDATE;
# YEAR="${array[0]}";
# MONTH="${array[1]}";
# DAY="${array[2]}";

# cd ./captured &&
# mkdir -p "$YEAR" &&
# cd "$YEAR" &&
# mkdir -p "$MONTH" &&
# cd "$MONTH" &&
# mkdir -p "$DAY";


# Upload the newly created folder structure for today screenshots
#lftp -e "
#open $HOST
#user $USER $PASS
#lcd $SOURCEFOLDER
#mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
#bye
#"

while true; do
  #SERVERTIME=`curl -s "$SITE/ajax/time/get-server-datetime" | jq '.currentTime'`;
  #tmp="${SERVERTIME%\"}";
  #SERVERTIME="${tmp#\"}";
  echo "Waiting to capture...";

  scrot -d 30 -q 40 '%Y-%m-%d-%H:%M:%S.png' -e 'mv $f ./captured';

  lftp -e "
  open $HOST
  user $USER $PASS
  lcd $SOURCEFOLDER
  mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
  bye
  "
done