
FROM openjdk:8-jre-alpine3.9
COPY /target/myapp-1.0-SNAPSHOT.jar /demo.jar
CMD ["java", "-jar", "/demo.jar"]




