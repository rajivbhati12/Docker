##################################################################################################################
# To create tomcat 9 image from jre-headless
# build command [example]:-
# docker build -t rajivbhati12/ubuntu_tomcat $PWD/docker-tomcat/.
# build arg: None
# run command [example] :-
# docker run -it --rm --name tomcat-9 -p 8081:8080 rajivbhati12/ubuntu_tomcat
# known issue(s): None
# workaround: None
##################################################################################################################

# Use jre headless as base image
FROM rajivbhati12/ubuntu_java_jre_headless

# Switch to root user for installation
USER root

# Set required environment variables
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.0.M17
ENV TOMCAT_TGZ_URL https://www.apache.org/dyn/closer.cgi?action=download&filename=tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV TOMCAT_ASC_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz.asc

# Create tomcat directory
RUN mkdir -p "$CATALINA_HOME"

# Set default work directory to tomcat
WORKDIR $CATALINA_HOME

# set GPG keys for verification
ENV GPG_KEYS 05AB33110949707C93A279E3D3EFE6B686867BA6 07E48665A34DCAFAE522E5E6266191C37C037D42 47309207D818FFD8DCD3F83F1931D684307A10A5 541FBE7D8F78B25E055DDEE13C370389288584E7 61B832AC2F1C5A90F0F9B00A1C506407564C17A3 79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED 9BA44C2621385CB966EBA586F72C284D731FABEE A27677289986DB50844682F8ACB77FC2E86E29AC A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23


RUN set -ex; \
	for key in $GPG_KEYS; do \
		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
	done

# Install tomcat after verification
RUN set -x \
	\
	&& wget -q -O tomcat.tar.gz "$TOMCAT_TGZ_URL" \
	&& wget -q -O tomcat.tar.gz.asc "$TOMCAT_ASC_URL" \
	&& gpg --batch --verify tomcat.tar.gz.asc tomcat.tar.gz \
	&& tar -xvf tomcat.tar.gz --strip-components=1 \
	&& rm bin/*.bat \
	&& rm tomcat.tar.gz*

# Set ownership to testuser
RUN chown -R testuser:testuser "$CATALINA_HOME" 

# Expose port to avoid port crash with other applications
EXPOSE 8080

# Switch back to testuser
USER testuser

# Set launch command
CMD ["catalina.sh","run"]
