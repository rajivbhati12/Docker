##################################################################################################################
# build command [example]:- 
# docker build -t rajivbhati12/ubuntu_java_jre_headless --build-arg Install_Java=9-jre-headless $PWD/docker-java/.
# build arg:	
#	1]		argument 	-> Install_Java
#			type		-> Optional
#			default value	-> 9-jre-headless
# 			value format	-> <version>-<jre/jdk>{-<headless>}
#			example		-> 8-jre, 8-jdk, 8-jdk-headless 
#
# run command [example] : docker run -it --name java-jre-headless rajivbhati12/ubuntu_java_jre_headless
# sharing: with this container [start/stop], others can access jdk/jre[without installing java] by mounting --volume-from this container
# 	example: docker run --volume-from java-jre rajivbhati12/ubuntu_selenium_grid and 
#	         correspoinding container/image must have ENV PATH "$PATH:/usr/lib/jvm/java/bin"   
# known issues : None
# work around: None
#################################################################################################################

# Use Test image 
FROM rajivbhati12/ubuntu_testuser

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Argument to provide flexibility to build [#version]-[jdk/jre]{-[headless]}
ARG Install_Java

# Switch to root user for installation
USER root

# Get update list of package from server and install java
RUN apt-get update && \
	apt-get -qqy install openjdk-${Install_Java:-9-jre-headless} && \
	rm -rf /var/lib/apt/lists/*

# Symlink to keep java share directory name same
RUN ln -s `sudo update-java-alternatives -l | awk '{print $3}'` /usr/lib/jvm/java

#Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java

# Share java installed volume to enable java access by containers
VOLUME /usr/lib/jvm

# Switch back to testuser
USER testuser
