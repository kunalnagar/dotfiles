#!/bin/bash

download_backup_path="/srv/dev-disk-by-label-Storage1/Backups/openvpn/config.tz"
extract_config_path="/srv/dev-disk-by-label-Storage1/Config/openvpn"

sudo tar xvf ${download_backup_path} --directory ${extract_config_path}
