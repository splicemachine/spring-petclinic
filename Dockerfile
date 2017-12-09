# Alpine Based
#FROM openjdk:alpine

# Debian Based
FROM openjdk:latest

# Deprecated
#FROM java:8-jre

MAINTAINER Nikhil Nygaard <nnygaard@splicemachine.com>


#ARG DATABASE_HOST
#ENV DATABASE_HOST=$DATABASE_HOST
#ENV DATABASE_HOST

# Spring Boot application creates working directories for Tomcat by default
VOLUME /tmp
ADD ./target/spring-petclinic-1.5.1.jar petclinic.jar

RUN sh -c 'touch /petclinic.jar'

#RUN apk --no-cache add curl

# To reduce Tomcat startup time we added a system property pointing to "/dev/urandom" as a source of entropy.
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.datasource.url=jdbc:splice://docker.for.mac.localhost:1527/splicedb;user=splice;password=admin","-jar","/petclinic.jar"]
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.datasource.url=${DATABASE_HOST}","-jar","/petclinic.jar"]
ENTRYPOINT java \
           -Dspring.datasource.url="jdbc:splice://docker.for.mac.localhost:1527/splicedb;user=splice;password=admin" \
           -Djava.security.egd=file:/dev/./urandom \
           -jar /petclinic.jar
