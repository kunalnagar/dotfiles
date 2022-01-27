# Nextcloud Backup

This essentially backs up the Config and the DB creating two files:

- config.tgz
- db.tgz

This script runs on Mon, Wed, Fri, Sun at 1:00AM before the Duplicati job to backup runs at 3:00AM.
