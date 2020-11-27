#!/bin/bash

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
sudo apt-get install -y libav-tools

youtube-dl --version

# Download mp3 of a YouTube video
# youtube-dl -x --audio-format mp3 <video_url_here>
