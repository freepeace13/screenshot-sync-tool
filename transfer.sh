#!/bin/bash
source config.sh

while true; do
    lftp -e "
    open ${HOST}
    user ${USER} ${PASS}
    mirror --reverse --verbose ./captured/online ${TARGETFOLDER}
    bye";

    sleep $((INTERVAL / 2))
done