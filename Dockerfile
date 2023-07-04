### Pull base image
FROM tomcat:8-jre8
MAINTAINER prasadmurakunda@gmail.com
COPY **/*.jar /usr/local/tomcat/webapps
