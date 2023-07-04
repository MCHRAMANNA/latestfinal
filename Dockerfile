### Pull base image
FROM tomcat:8-jre8
MAINTAINER prasadmurakunda@gmail.com
COPY **/JenkinsWar.war /usr/local/tomcat/webapps
RUN ls /usr/local/tomcat/webapps
