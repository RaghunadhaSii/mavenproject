
FROM openjdk:8-jre-alpine3.9

COPY /target/myapp-1.0-SNAPSHOT.jar /deployment

CMD ["java", "-jar", "/myapp-1.0-SNAPSHOT.jar"]

EXPOSE 8080




