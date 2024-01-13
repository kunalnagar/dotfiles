#!/bin/bash

start_time=$(date +%s)

# backup
rm -rf /backups/config
rm -rf /backups/config.tgz
mkdir /backups/config
cp -r /var/www/nextcloud /backups/config/
cp -r /var/www/nextcloud-data /backups/config/
tar -cvjf /backups/config.tgz /backups/config

end_time=$(date +%s)
elapsed=$(( end_time - start_time ))
elapsed_string=$(eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')")

echo $elapsed_string
