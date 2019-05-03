#!/bin/sh

# Basic parameters
ADSB_SOURCE_URL=http://localhost:30003
ADSB_STORAGE_PATH=/media/pi/USB_DISK/adsb-data
ADSB_LOGGING_PATH=/media/pi/USB_DISK/logs
ADSB_MSG_FILTER='MSG,[134],'

# Kill any running log
echo "Closing previous log..."
# This will kill _any_ wget attached to the source
pkill -f 'wget.*'"$ADSB_SOURCE_URL"

# Start the new log
ADSB_LOG_NAME=${ADSB_STORAGE_PATH}"/"$(date -u +"%Y%m%d%H%M%S")".csv"
echo "Opening new log... "$ADSB_LOG_NAME
nohup ./adsb-log-worker.sh "$ADSB_SOURCE_URL" "$ADSB_MSG_FILTER" "$ADSB_LOG_NAME" > ${ADSB_LOGGING_PATH}"/adsb-log-worker.log" 2>&1 &
