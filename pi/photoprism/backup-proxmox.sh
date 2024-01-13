#!/bin/bash

start_time=$(date +%s)

# backup
rm -rf /photoprism/backups/config
rm -rf /photoprism/backups/config.tgz
mkdir /photoprism/backups/config
cd ~/photoprism_docker && docker compose exec -T photoprism photoprism backup -i - > /photoprism/backups/config/db.sql
tar -cvjf /photoprism/backups/config.tgz /photoprism/backups/config

end_time=$(date +%s)
elapsed=$(( end_time - start_time ))
elapsed_string=$(eval "echo Elapsed time: $(date -ud "@$elapsed" +'$((%s/3600/24)) days %H hr %M min %S sec')")

echo $elapsed_string
