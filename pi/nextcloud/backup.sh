#!/bin/bash

# today=$(date +"%Y_%m_%d")
config_path="/srv/dev-disk-by-label-Storage1/Config/nextcloud/"
config_backup_path="/srv/dev-disk-by-label-Storage1/Backups/duplicati/nextcloud/config.tgz"
db_path="/srv/dev-disk-by-label-Storage1/Databases/nextcloud"
db_backup_path="/srv/dev-disk-by-label-Storage1/Backups/duplicati/nextcloud/db.tgz"

# DB Backup
sudo tar -cvjf ${db_backup_path} -C ${db_path} .

# Config Backup
sudo tar -cvjf ${config_backup_path} -C ${config_path} .
