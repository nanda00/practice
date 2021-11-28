FROM tomee
COPY /webapp/target/webapp.war /usr/local/tomee/webapps/webapp.war
-p 9090:8080
