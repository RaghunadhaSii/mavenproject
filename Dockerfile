
FROM nginx:latest

COPY /target/myapp-1.0-SNAPSHOT.jar /deployment

CMD ["java", "-jar", "/myapp-1.0-SNAPSHOT.jar"]

EXPOSE 80
