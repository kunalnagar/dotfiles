#!/bin/bash

start_time=$(date +%s)
config_path="/srv/dev-disk-by-label-Storage1/Config/HomeAssistant/"
config_backup_path="/srv/dev-disk-by-label-Storage1/Backups/duplicati/home-assistant/config.tgz"

# backup
sudo tar -cvjf ${config_backup_path} -C ${config_path} .

end_time=$(date +%s)
elapsed=$(( end_time - start_time ))
elapsed_string=$(eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')")

# Send email
echo -e "Subject: raspberrypi - Backup - Home Assistant DONE\r\n\r\nThe backup was successful.\n${elapsed_string}." | msmtp --from=default -t knlnagar@gmail.com
