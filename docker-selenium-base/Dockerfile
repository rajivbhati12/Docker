######################
# This will build base image of selenium server that will allow sharing of server jar
######################

# Testuser image as base
FROM rajivbhati12/ubuntu_testuser:v1

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Selenium Standalone Server version
ENV SELENIUM_V_MAJOR 3
ENV SELENIUM_V_MINOR 0
ENV SELENIUM_V_PATCH 1 

# Installation directory
ENV INSTALL_DIR /opt/selenium-base

# Set root user for modification
USER root

# Download selenium standalone server
RUN mkdir ${INSTALL_DIR}
RUN wget -O ${INSTALL_DIR}/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/${SELENIUM_V_MAJOR}.${SELENIUM_V_MINOR}/selenium-server-standalone-${SELENIUM_V_MAJOR}.${SELENIUM_V_MINOR}.${SELENIUM_V_PATCH}.jar

# Share selenium standalone server installed volume to enable sharing of server jar between cointainers
VOLUME ${INSTALL_DIR}

# Enable execute permission
#RUN chmod a+x ${INSTALL_DIR}/selenium-server-standalone.jar

# Switch back to testuser
USER testuser


