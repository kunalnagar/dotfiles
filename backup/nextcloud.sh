#!/bin/bash

today=$(date +"%Y_%m_%d")
filename=$today"_Nextcloud_backup"
filename_db=$tody"_Nextcloud_sql.bak"

sudo -u www-data php /var/www/html/nextcloud/occ maintenance:mode --on

sudo su
rsync -Aavx /var/www/html/nextcloud/ /home/media/pi/Nextcloud/Backups/${filename}
zip ${filename}
rm -rf ${filename}

mysqldump --single-transaction -h ${NEXTCLOUD_SERVER} -u ${NEXTCLOUD_DB_USER} -p${NEXTCLOUD_DB_PASSWORD} ${NEXTCLOUD_DB} > ${filename_db}
