# Docker image to use.
FROM sloopstash/amazonlinux:v1
 
# Install system packages.
RUN yum install -y wget tar gzip vim procps libcurl openssl xz-libs
 
# Download and extract Mongodb.
WORKDIR /tmp
RUN set -x \
  && wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-amazon2-4.4.4.tgz \
  && tar -zxvf mongodb-linux-x86_64-amazon2-4.4.4.tgz \
  && cp mongodb-linux-x86_64-amazon2-4.4.4/bin/* /usr/local/bin/ \
  && rm -r mongodb-linux-x86_64-amazon2-4.4.4*
 
# Create necessary directories.
RUN set -x \
  && mkdir -p /opt/mongo-db/data \
  && mkdir -p /opt/mongo-db/log \
  && mkdir -p /opt/mongo-db/conf \
  && history -c
 
# Set default work directory.
WORKDIR /opt/mongo-db