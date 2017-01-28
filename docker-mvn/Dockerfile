# Base Ubuntu Image 
FROM rajivbhati12/ubuntu_java

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Switch to root for installation
USER root

# Get update list of package from server
RUN apt-get update && \
	apt-get -qqy install maven && \
	rm -rf /var/lib/apt/lists/*

# Switch back to testuser
USER testuser
