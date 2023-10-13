FROM tomcat:8.0.20-jre8

RUN mkdir -p /usr/local/tomcat/webapps/

COPY survey.war /usr/local/tomcat/webapps/