#!/bin/bash

# set kopia config, make snapshot with kopia, write log, ping healthchecks
#kopia repository create b2 --bucket=BUCKETNAME --key-id=KEYID --key=KEY --password=KOPIA_PASSWORD
#kopia repository connect b2 --bucket=BUCKETNAME --key-id=KEYID --key=KEY --password=KOPIA_PASSWORD
#kopia policy set --global --compression=zstd-fastest


kopia snapshot create /srv/docker --log-dir=/var/log/kopia.log

curl https://hc-ping.com/uid

kopia snapshot create /var/lib/docker/volumes --log-dir=/var/log/kopia.log

curl https://hc-ping.com/uid