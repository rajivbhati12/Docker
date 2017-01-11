# Base Ubuntu Image 
FROM ubuntu:16.04

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Password argument initialization for admin and test  
ARG TestUser_Password

USER root
# Set default values if empty
ENV TestUser_Default_Password main@123
ENV TestUser_Password ${TestUser_Password:-TestUser_Default_Password}


# Customize sources for apt-get
RUN  echo "deb http://archive.ubuntu.com/ubuntu xenial main universe\n" > /etc/apt/sources.list \
	&& echo "deb http://archive.ubuntu.com/ubuntu xenial-updates main universe\n" >> /etc/apt/sources.list \
	&& echo "deb http://security.ubuntu.com/ubuntu xenial-security main universe\n" >> /etc/apt/sources.list

# Get update list of package from server
RUN apt-get update && \
	apt-get -y install sudo && \
        apt-get -y install wget && \
	apt-get -y install zip unzip && \
	rm -rf /var/lib/apt/lists/*

# Create test user with password less sudo access
RUN useradd -m testuser \
	&& sudo usermod -a -G sudo testuser \
	&& echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \  
	&& echo "testuser:"${TestUser_Password} | chpasswd


# Set default container user and work directory as per testuser
USER testuser
WORKDIR /home/testuser
