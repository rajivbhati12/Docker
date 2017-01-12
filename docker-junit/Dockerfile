# Use Test image 
FROM rajivbhati12/ubuntu_testuser:latest

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# JUnit version to download
ENV Junit_Version 4.10

# Switch to root user for modification
USER root

# download JUnit
RUN mkdir /opt/junit && wget -q -O /opt/junit/junit.jar https://sourceforge.net/projects/junit/files/junit/${Junit_Version}/junit-${Junit_Version}.jar/download
RUN -q -O /opt/junit/hamcrest-core.jar http://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar

# Switch back to testUser
USER testuser
