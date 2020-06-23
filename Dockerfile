
FROM openjdk:8-jre-alpine3.9
COPY /var/lib/jenkins/workspace/JfrogDemo/target/myapp-1.0-SNAPSHOT.jar /demo.jar
CMD ["java", "-jar", "/demo.jar"]




