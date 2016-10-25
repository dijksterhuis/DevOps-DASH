#!/bin/bash
set -e

if [ $# -eq 0 ] ; then
	echo "dashify.sh <input-file>"
	exit 1
fi

filename=$(basename ${1})
name="${filename%.*}"

mkdir -p ${name}
mkdir -p tmp

# ffmpeg commands based on https://www.radiantmediaplayer.com/guides/working-with-ffmpeg.html
ffmpeg -i ${1} -s 640x360 -c:v libx264 -b:v 600k -r 24 -x264opts keyint=48:min-keyint=48:no-scenecut -profile:v main -preset medium -movflags +faststart -c:a aac -strict -2 -b:a 128k -ac 2 tmp/${name}-640x360_600k.mp4
ffmpeg -i ${1} -s 1280x720 -c:v libx264 -b:v 2200k -r 24 -x264opts keyint=48:min-keyint=48:no-scenecut -profile:v main -preset medium -movflags +faststart -c:a aac -strict -2 -b:a 128k -ac 2 tmp/${name}-1280x720_2200k.mp4
ffmpeg -i ${1} -s 1920x1080 -c:v libx264 -b:v 4000k -r 24 -x264opts keyint=48:min-keyint=48:no-scenecut -profile:v main -preset medium -movflags +faststart -c:a aac -strict -2 -b:a 128k -ac 2 tmp/${name}-1920x1080_4000k.mp4

# Based on https://www.radiantmediaplayer.com/guides/working-with-mp4box.html
MP4Box -dash 4000 -rap -bs-switching no -profile dashavc264:live \
   -out ${name}/manifest.mpd \
	tmp/${name}-640x360_600k.mp4#audio \
	tmp/${name}-640x360_600k.mp4#video \
	tmp/${name}-1280x720_2200k.mp4#video \
	tmp/${name}-1920x1080_4000k.mp4#video

rm tmp/*
