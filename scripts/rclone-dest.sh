#rclone archive/backup script

#!/bin/bash
# RCLONE UPLOAD CRON TAB SCRIPT
# Type crontab -e and add line below (without # )
# * * * * * root /opt/scripts/rclone.sh >/dev/null 2>&1

LOGFILE="/var/log/rclone.log"
CONFIG="/opt/scripts/rclone/rclone.conf"
FROM1="hetznercrypt:"
TO1="b2crypt:"
TO2="storaderacrypt:"

#start healthchecks1
curl https://hc-ping.com/75c8d4be-7179-46fb-9c91-2cdd725a84bf/start
rclone --config=$CONFIG sync $FROM1 $TO1 -P --fast-list --transfers 4 --checkers=8 --order-by size,mixed,75 --max-backlog 10000 --b2-chunk-size 16M --log-file=$LOGFILE --log-level Info
#stop healthchecks1
curl https://hc-ping.com/75c8d4be-7179-46fb-9c91-2cdd725a84bf

#______________________________________________________________

#start healthchecks2
curl https://hc-ping.com/b58d6838-c2e9-4886-ae9f-74fcdae8fca6/start
rclone --config=$CONFIG sync $FROM1 $TO2 -P --fast-list --transfers 4 --checkers=8 --order-by size,mixed,75 --max-backlog 10000 --b2-chunk-size 16M --log-file=$LOGFILE --log-level Info
#stop healthchecks1
curl https://hc-ping.com/b58d6838-c2e9-4886-ae9f-74fcdae8fca6

exit