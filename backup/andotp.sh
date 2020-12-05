#!/usr/bin/env bash

today=$(date +"%Y_%m_%d")
basefilename=$(basename ~/andOTP/*.json.aes)
filename=$today"_"$basefilename
gpg -c ~/andOTP/*.json.aes
mv ~/andOTP/*.json.aes.gpg ~/andOTP/${filename}.gpg
mv ~/andOTP/${filename}.gpg ~/Dropbox/Nextcloud/meh/pi/andOTP/
rm -rf ~/andOTP/${filename}.gpg
