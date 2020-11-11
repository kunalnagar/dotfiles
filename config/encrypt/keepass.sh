#!/usr/bin/env bash

today=$(date +"%Y_%m_%d")
filename=$today"_Database.kdbx.gpg"
gpg -c ~/KeePass/Database.kdbx
mv ~/KeePass/Database.kdbx.gpg ~/KeePass/${filename}
mv ~/KeePass/${filename} ~/Dropbox/Nextcloud/meh/pi/KeePass/
rm -rf ~/KeePass/${filename}