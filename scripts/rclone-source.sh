#rclone archive/backup script

#!/bin/bash
# RCLONE UPLOAD CRON TAB SCRIPT
# Type crontab -e and add line below (without # )
# * * * * * root /opt/scripts/rclone.sh >/dev/null 2>&1

LOGFILE="/var/log/rclone.log"
CONFIG="/opt/scripts/rclone/rclone.conf"
FROM1="/srv/dev-disk-by-uuid-cef55e21-adc6-45e4-89c2-26968aeb0d80/shares/archive/"
FROM2="/srv/dev-disk-by-uuid-cef55e21-adc6-45e4-89c2-26968aeb0d80/shares/backups/"
TO1="hetznercrypt:/archive"
TO2="hetznercrypt:/backups"

#start healthchecks1
curl https://hc-ping.com/c3db77ba-d08e-45cb-b566-placeholder/start
rclone --config=$CONFIG sync $FROM1 $TO1 -P --fast-list --transfers 8 --checkers=8 --order-by size,mixed,75 --max-backlog 10000 --sftp-chunk-size 32k --log-file=$LOGFILE --log-level Info
#stop healthchecks1
curl https://hc-ping.com/c3db77ba-d08e-45cb-b566-placeholder

#______________________________________________________________
#start healthchecks2
curl https://hc-ping.com/c44ce2a1-e8fe-4515-9d2d-bplaceholder/start
rclone --config=$CONFIG sync $FROM2 $TO2 -P --fast-list --transfers 8 --checkers=8 --order-by size,mixed,75 --max-backlog 10000 --sftp-chunk-size 32k --log-file=$LOGFILE --log-level Info
#stop healthchecks2
curl https://hc-ping.com/c44ce2a1-e8fe-4515-9d2d-placeholder

exit