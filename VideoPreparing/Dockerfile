# Version: 0.0.1
FROM ubuntu:16.04
MAINTAINER Johannes Postma "j.g.m.postma@dundee.ac.uk"
RUN apt-get update
RUN apt-get install -y ffmpeg gpac
RUN mkdir -p /data
COPY dashify.sh /usr/bin
RUN chmod a+x /usr/bin/dashify.sh

