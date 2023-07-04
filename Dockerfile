### Pull base image
FROM tomcat:8-jre8
MAINTAINER prasadmurakunda@gmail.com
COPY **/JenkinsWar.jar /usr/local/tomcat/webapps
RUN ls /usr/local/tomcat/webapps
