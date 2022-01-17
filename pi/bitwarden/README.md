# Bitwarden Backup

This essentially backs up the Config and the DB creating two files:

- config.tgz

This script runs on a CRON every Monday and Friday at 1:00AM before the Duplicati job to backup runs at 3:00AM.
