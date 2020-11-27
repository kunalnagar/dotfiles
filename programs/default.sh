#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install build-essential
install make
install zlib1g-dev
install unity-tweak-tool
install gparted
install exfat-fuse
install exfat-utils
install keepassx
