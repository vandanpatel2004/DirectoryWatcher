#!/bin/bash

#Check if inotifywait is installed
if [ -z "$(which inotifywait)" ]; then
    echo "Please install inotify-tools package."
    exit 1
fi

#Get arguments for directory and log file
pathname="$1"
logfile="$2"

#Validate arguments
if [ -z "$pathname" ] || [ -z "$logfile" ]; then
    echo "Error: Missing required arguments."
    echo ""Please specify the directory to monitor and the log file for recording events.""
    exit 1
fi

if [ ! -d "$pathname" ]; then
    echo "Error: Directory '$pathname' does not exist."
    exit 1
fi

if [ ! -f "$logfile" ]; then
    echo "Log file does not exist. Creating '$logfile'."
    touch "$logfile"
fi

if [ ! -w "$logfile" ]; then
    echo "Error: Log file '$logfile' is not writable."
    exit 1
fi

#Start monitoring the directory
echo "Watching directory '$pathname'. Logging events to '$logfile'."

inotifywait -m -e create -e delete -e modify -e moved_to -e moved_from \
    --timefmt '%Y-%m-%d %H:%M:%S' \
    --format '{"timestamp":"%T", "event":"%e", "file/directory":"%w%f"}' \
    "$pathname" >> "$logfile" 
