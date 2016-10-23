# Version: 0.0.1
FROM ubuntu:16.04
MAINTAINER Johannes Postma "j.g.m.postma@dundee.ac.uk"
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository main
RUN add-apt-repository universe
RUN add-apt-repository multiverse
RUN add-apt-repository restricted
RUN apt-get update
RUN apt-get install -y ffmpeg gpac
RUN mkdir -p /data

