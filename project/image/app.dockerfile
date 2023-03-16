# Docker image to use.
FROM sloopstash/amazonlinux:v1
 
# Install system packages.
RUN yum install -y wget vim procps tar gzip xz
 
# Download and extract NodeJS.
WORKDIR /tmp
RUN set -x \
  && wget https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz \
  && mkdir -p /usr/local/lib/nodejs \
  && tar -xJvf node-v14.16.0-linux-x64.tar.xz -C /usr/local/lib/nodejs \
  && rm node-v14.16.0-linux-x64.tar.xz
 
# Create necessary directories.
RUN set -x \
  && mkdir -p /opt/app/source \
  && mkdir -p /opt/app/log
 
# Setting shell environment variable.
ENV PATH=/usr/local/lib/nodejs/node-v14.16.0-linux-x64/bin:$PATH
ENV NODE_PATH=/opt/app/node_modules
 
# Install NodeJS packages.
WORKDIR /opt/app
RUN set -x \
  && npm install mongodb@3.6.5 \
  && npm install express@4.17.1  \
  && history -c
 
# Set default work directory.
WORKDIR /opt/app