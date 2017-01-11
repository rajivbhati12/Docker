#Testuser image as base
FROM rajivbhati12/ubuntu_testuser:v1

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true


# Update Path to accept java command
ENV PATH "$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin/"

#===================
# Timezone settings
# Possible alternative: https://github.com/docker/docker/issues/3359#issuecomment-32150214
#===================
ENV TZ "US/Eastern"
RUN echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata

#==============
# VNC and Xvfb
#==============
RUN apt-get update -qqy \
  && apt-get -qqy install \
    xvfb \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

#==============================
# Scripts to run Selenium Node
#==============================
RUN mkdir -p /opt/bin
RUN wget -q -O /opt/bin/entry_point.sh https://github.com/SeleniumHQ/docker-selenium/raw/master/NodeBase/entry_point.sh
RUN wget -q -O /opt/bin/functions.sh https://github.com/SeleniumHQ/docker-selenium/raw/master/NodeBase/functions.sh
RUN chmod +x /opt/bin/entry_point.sh

#============================
# Some configuration options
#============================
ENV SCREEN_WIDTH 1360
ENV SCREEN_HEIGHT 1020
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0

USER testuser
CMD ["/opt/bin/entry_point.sh"]
