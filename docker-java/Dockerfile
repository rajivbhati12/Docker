# Use Test image 
FROM rajivbhati12/ubuntu_testuser:v1

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

USER root
# Java version in install directory
ENV Install_Java openjdk-8-jdk
ENV Install_Dir /usr/lib/jvm/java-8-openjdk-amd64

# Get update list of package from server and install java
RUN apt-get update && \
	apt-get -y install ${Install_Java} && \
	rm -rf /var/lib/apt/lists/*

# Share java installed volume to enable java access by containers
VOLUME ${Install_Dir}

USER testuser
