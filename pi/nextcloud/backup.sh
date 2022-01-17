#!/bin/bash

start_time=$(date +%s)
config_path="/srv/dev-disk-by-label-Storage1/Config/nextcloud/"
config_backup_path="/srv/dev-disk-by-label-Storage1/Backups/duplicati/nextcloud/config.tgz"
db_path="/srv/dev-disk-by-label-Storage1/Databases/nextcloud"
db_backup_path="/srv/dev-disk-by-label-Storage1/Backups/duplicati/nextcloud/db.tgz"

# DB Backup
sudo tar -cvjf ${db_backup_path} -C ${db_path} .

# Config Backup
sudo tar -cvjf ${config_backup_path} -C ${config_path} .

end_time=$(date +%s)
elapsed=$(( end_time - start_time ))
elapsed_string=$(eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')")

# Send email
echo -e "Subject: raspberrypi - Backup - Nextcloud DONE\r\n\r\nThe backup was successful.\n${elapsed_string}." | msmtp --from=default -t knlnagar@gmail.com
