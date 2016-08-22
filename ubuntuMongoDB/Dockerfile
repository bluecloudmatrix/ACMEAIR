#
# MongoDB Dockerfile
#

# Pull base image
FROM       ubuntu:latest

MAINTAINER LIU Qiu Shan <qsliubj@cn.ibm.com>


# Install MongoDB
# The real logic
# Add 10gen official apt source to the sources list
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/*
######################################
# Define mountable directories
VOLUME ["/data/db"] 

# Define working directory
WORKDIR /data

# Define default mongodb command
CMD ["mongod"]

######################################

# Create the MongoDB data directory
#RUN mkdir -p /data/db

# Expose the process port of mongodb
EXPOSE 27017

# Expose the http port of mongodb
#EXPOSE 28017

# Set usr/bin/mongod as the dockerized entry-point application
#ENTRYPOINT usr/bin/mongod




