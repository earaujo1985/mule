FROM java:openjdk-8-jdk

MAINTAINER Everton Araujo <everton.araujo1985@gmail.com>

#MULE INSTALL FOR DOCKERFILES

RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.8.1/mule-standalone-3.8.1.tar.gz && echo "db079c0fc01c534d443277cfe96ab252 mule-standalone-3.8.1.tar.gz" | md5sum -c

RUN cd /opt && tar xvzf ~/mule-standalone-3.8.1.tar.gz && rm ~/mule-standalone-3.8.1.tar.gz && ln -s /opt/mule-standalone-3.8.1 /opt/mule

# Define environment variables.
ENV MULE_HOME /opt/mule

# Define mount points.
VOLUME ["/opt/mule/logs", "/opt/mule/conf", "/opt/mule/apps", "/opt/mule/domains"]


# Define working directory.
WORKDIR /opt/mule

CMD [ "/opt/mule/bin/mule" ]

RUN apt-get update 
RUN apt-get install maven -y
RUN apt-get install openssh-server -y 

# Default http port
EXPOSE 8081
EXPOSE 8082
EXPOSE 22
