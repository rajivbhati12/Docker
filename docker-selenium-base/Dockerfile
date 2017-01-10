######################
# This will build base image of selenium server that will allow sharing of server jar
######################

# Testuser image as base
FROM rajivbhati12/ubuntu_testuser:v1

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Selenium Standalone Server version
ENV Selenium_Ver_Major 3
ENV Selenium_Ver_Minor 0
ENV Selenium_Ver_Patch 1 

# Installation directory
ENV Install_Dir /opt/selenium-base

# Set root user for modification
USER root

# Download selenium standalone server
RUN mkdir ${Install_Dir}
RUN wget -O ${Install_Dir}/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/${Selenium_Ver_Major}.${Selenium_Ver_Minor}/selenium-server-standalone-${Selenium_Ver_Major}.${Selenium_Ver_Minor}.${Selenium_Ver_Patch}.jar

# Share selenium standalone server installed volume to enable sharing of server jar between cointainers
VOLUME ${Install_Dir}

# Enable execute permission
#RUN chmod a+x ${INSTALL_DIR}/selenium-server-standalone.jar

# Switch back to testuser
USER testuser


