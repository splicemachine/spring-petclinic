FROM openjdk:alpine
MAINTAINER Nikhil Nygaard <nnygaard@splicemachine.com>

# Spring Boot application creates working directories for Tomcat by default
VOLUME /tmp
ADD ./target/spring-petclinic-1.5.1.jar petclinic.jar

RUN sh -c 'touch /petclinic.jar'

RUN apk --no-cache add curl

# To reduce Tomcat startup time we added a system property pointing to "/dev/urandom" as a source of entropy.
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/petclinic.jar"]
