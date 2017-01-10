# Base Ubuntu Image 
FROM ubuntu:16.04

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Password argument initialization for admin and test  
ARG TestUser_Password

# Set default values if empty
ENV TestUser_Default_Password main@123
ENV TestUser_Password ${TestUser_Password:-TestUser_Default_Password}

# Get update list of package from server
RUN apt-get update && \
	apt-get -y install sudo && \
        apt-get -y install wget && \
	apt-get -y install zip unzip && \
	rm -rf /var/lib/apt/lists/*

# Create test and admin user
RUN useradd -m testuser  && echo "testuser:"${TestUser_Password} | chpasswd


# Set default container user and work directory as per testuser
USER testuser
WORKDIR /home/testuser
