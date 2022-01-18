#!/bin/bash

start_time=$(date +%s)
card_path="/dev/mmcblk0"
backup_path="/srv/dev-disk-by-label-Storage1/Backups/pi-img/backup.img"

# Make .img file
sudo dd bs=4M if=${card_path} of=${backup_path} status=progress

end_time=$(date +%s)
elapsed=$(( end_time - start_time ))
elapsed_string=$(eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')")

# Send email
echo -e "Subject: raspberrypi - Backup - Complete Image DONE\r\n\r\nThe image was created successfully.\n${elapsed_string}." | msmtp --from=default -t knlnagar@gmail.com
