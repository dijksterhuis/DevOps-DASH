# Version: 0.0.1
FROM ubuntu:16.04
MAINTAINER Johannes Postma "j.g.m.postma@dundee.ac.uk"
RUN apt-get update
RUN apt-get install -y nginx
COPY nginx.conf /etc/nginx
RUN mkdir -p /data
COPY www/ /data/
CMD service nginx start && tail -F /var/log/nginx/error-streaming.log
EXPOSE 80

