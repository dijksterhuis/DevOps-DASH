# Version: 0.0.1
FROM ubuntu:16.04
MAINTAINER Johannes Postma "j.g.m.postma@dundee.ac.uk"
RUN apt-get update
RUN apt-get install -y nginx
RUN update-rc.d nginx defaults
RUN mkdir -p /data
EXPOSE 80

