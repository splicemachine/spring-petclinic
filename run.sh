#!/bin/sh

env

java \
-Dspring.datasource.url=$DATABASE_HOST \
-Djava.security.egd=file:/dev/./urandom \
-jar /petclinic.jar
