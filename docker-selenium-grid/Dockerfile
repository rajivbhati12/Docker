# Testuser image as base
FROM rajivbhati12/ubuntu_testuser:v1

# Set author
MAINTAINER Rajiv Bhati<rajivbhati12@gmail.com>

# Set root user for modification
USER root

# Update Path to accept java command
ENV PATH "$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin/"

# Symlink for selenium server standalone jar
RUN mkdir /opt/selenium && ln -s /opt/selenium-base/selenium-server-standalone.jar /opt/selenium/selenium-server-standalone.jar

# Selenium Configuration

EXPOSE 4444

# Initialize Grid paramters
ENV GRID_THROW_ON_CAPABILITY_NOT_PRESENT true
ENV GRID_NEW_SESSION_WAIT_TIMEOUT -1
ENV GRID_JETTY_MAX_THREADS -1
ENV GRID_NODE_POLLING  5000
ENV GRID_CLEAN_UP_CYCLE 5000
ENV GRID_TIMEOUT 30000
ENV GRID_BROWSER_TIMEOUT 0
ENV GRID_MAX_SESSION 5
ENV GRID_UNREGISTER_IF_STILL_DOWN_AFTER 30000

# Download configuration and entry point
RUN mkdir /opt/bin
RUN wget -O /opt/selenium/generate_config https://github.com/SeleniumHQ/docker-selenium/raw/master/Hub/generate_config
RUN wget -O /opt/bin/entry_point.sh https://raw.githubusercontent.com/SeleniumHQ/docker-selenium/master/Hub/entry_point.sh 


# Enable execute permission
RUN chmod a+x /opt/bin/entry_point.sh \
    && chmod a+x /opt/selenium/generate_config 

# Generte selenium config
RUN /opt/selenium/generate_config > /opt/selenium/config.json

# Enable testuser access on selenium 
RUN chown -R testuser /opt/selenium

# Switch back to testuser
USER testuser

# Define execution command
CMD ["/opt/bin/entry_point.sh"]
