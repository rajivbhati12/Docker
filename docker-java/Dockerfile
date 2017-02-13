# Use Test image 
FROM rajivbhati12/ubuntu_testuser

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Argument to provide flexibility to build [#version]-[jdk/jre]{-[headless]}
ARG Install_Java

USER root

# Java version in install directory
ENV Install_Default_Java 9-jre-headless
ENV Install_Java openjdk-${Install_Java:-${Install_Default_Java}}
ENV Share_Java /usr/lib/jvm

# Get update list of package from server and install java
RUN apt-get update && \
	apt-get -qqy install ${Install_Java} && \
	rm -rf /var/lib/apt/lists/*


# Symlink to keep java dir name same
RUN ln -s $(dirname $(dirname $(dirname $(readlink -f /usr/bin/java))))/bin $(dirname $(dirname $(dirname $(dirname $(readlink -f /usr/bin/java)))))/java

# Share java installed volume to enable java access by containers
VOLUME ${Share_Java}

USER testuser
