FROM tomcat:9
COPY /webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war
EXPOSE 9090 8080
