FROM tomcat:8.0.20-jre8

COPY /var/lib/jenkins/workspace/JfrogDemo/target/myapp-1.0-SNAPSHOT.jar /usr/local/tomcat/webapps/myapp-1.0-SNAPSHOT.jar
