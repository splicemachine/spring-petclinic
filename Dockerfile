# Alpine Based
#FROM openjdk:alpine

# Debian Based
FROM openjdk:latest

# Deprecated
#FROM java:8-jre

MAINTAINER Nikhil Nygaard <nnygaard@splicemachine.com>

# Spring Boot application creates working directories for Tomcat by default
VOLUME /tmp
ADD ./target/spring-petclinic-1.5.1.jar petclinic.jar

RUN sh -c 'touch /petclinic.jar'

COPY ./run.sh /
CMD ["/bin/sh", "/run.sh"]
