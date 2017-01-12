# Use Test image 
FROM rajivbhati12/ubuntu_testuser:latest

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

USER root
# Java version in install directory
ENV Install_Java openjdk-8-jdk
ENV Share_Java /usr/lib/jvm

# Get update list of package from server and install java
RUN apt-get update && \
	apt-get -y install ${Install_Java} && \
	rm -rf /var/lib/apt/lists/*

# Symlink to keep java dir name same
RUN ln -s $(dirname $(dirname $(dirname $(readlink -f /usr/bin/java))))/bin $(dirname $(dirname $(dirname $(dirname $(readlink -f /usr/bin/java)))))/java

# Share java installed volume to enable java access by containers
VOLUME ${Share_Java}

USER testuser
