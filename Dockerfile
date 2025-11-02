# Build a Tomcat image that includes your WAR
FROM tomcat:9.0-jdk17-temurin

# Optional: clean default ROOT webapp to keep image lean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR from Jenkins build output into Tomcat
# Name it myapp.war (or NewProject.war) to control the context path
COPY target/NewProject.war /usr/local/tomcat/webapps/myapp.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
