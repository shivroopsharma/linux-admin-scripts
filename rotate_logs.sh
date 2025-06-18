#!/bin/bash

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/app.log"
ARCHIVE_DIR="$LOG_DIR/archive"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p "$ARCHIVE_DIR"

if [ -f "$LOG_FILE" ]; then
    mv "$LOG_FILE" "$ARCHIVE_DIR/app_$TIMESTAMP.log"
    echo "Rotated $LOG_FILE to $ARCHIVE_DIR/app_$TIMESTAMP.log"
else
    echo "Log file does not exist. Nothing to create"
fi

touch "$LOG_FILE"
