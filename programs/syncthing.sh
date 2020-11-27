#!/bin/bash

echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | sudo tee /etc/apt/preferences.d/syncthing

sudo apt update

sudo apt install syncthing
