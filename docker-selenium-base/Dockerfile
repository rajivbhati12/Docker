######################
# This will build base image of selenium server that will allow sharing of server jar
######################

# Testuser image as base
FROM rajivbhati12/ubuntu_testuser:latest

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

USER root 
# Selenium Standalone Server version
ENV Major_Version 3
ENV Minor_Version 0
ENV Patch_Version 1 

# Installation directory
ENV Install_Dir /opt/selenium-base

# Download selenium standalone server
RUN mkdir ${Install_Dir}
RUN wget -q -O ${Install_Dir}/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/${Major_Version}.${Minor_Version}/selenium-server-standalone-${Major_Version}.${Minor_Version}.${Patch_Version}.jar

# Share selenium standalone server installed volume to enable sharing of server jar between cointainers
VOLUME ${Install_Dir}

USER testuser
