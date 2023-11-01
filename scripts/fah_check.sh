#!/bin/bash

log_file="/var/lib/fahclient/log.txt"
keyword="Final credit estimate"
#check_interval=300  # Set the interval in seconds (e.g., 300 seconds = 5 minutes)

# while true; do # only used if scheduling is not done via crontab
    # Use tail to get the last 150 lines of the log file
    tail -n 150 "$log_file" | grep "$keyword"

    if [ $? -ne 1 ]; then
        curl https://hc-ping.com/placeholder
        # your healthchecks url goes above
    fi

    # sleep "$check_interval" # removed as scheduling is done via crontab
done


