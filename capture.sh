#!/bin/bash
source config.sh

usage() {
    echo "Usage: $0 [-m (Mode) <online|offline>]"; exit 1;
}

offlineModeCapturing() {
    while true; do
        echo "Waiting to capture...";

        sleep $INTERVAL

        storage="./captured/offline/$(date '+%Y-%m-%d')";
        if [ ! -d $storage ]; then
            mkdir -p $storage;
        fi

        scrot -q $IMAGEQUALITY "$storage/$(date '+%Y-%m-%d-%H:%M:%S.png')" \
        -e "echo Captured at $(date '+%Y-%m-%d-%H:%M:%S')";
    done
}

onlineModeCapturing() {
    storage="./captured/online";
    if [ ! -d $storage ]; then
        mkdir -p $storage;
    fi

    ./transfer.sh &
    trap "kill $(ps aux | grep transfer.sh | grep -v grep | awk '{print $2}') && kill $(ps aux | grep lftp | grep -v grep | awk '{print $2}')" EXIT

    while true; do
        scrot -d $INTERVAL -q $IMAGEQUALITY "$storage/$(date '+%Y-%m-%d-%H:%M:%S').png"
    done
}

while getopts ":m:" o; do
    case "${o}" in
        m)
            m=${OPTARG}
            if [ "${m}" == "online" ]; then
                onlineModeCapturing
            elif [ "${m}" == "offline" ]; then
                offlineModeCapturing
            else
                usage
            fi
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${m}" ]; then
    usage
fi