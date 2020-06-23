
FROM java:8
WORKDIR /var/lib/jenkins/workspace/JfrogDemo/target/myapp-1.0-SNAPSHOT.jar
ADD myapp-1.0-SNAPSHOT.jar myapp-1.0-SNAPSHOT.jar
EXPOSE 8083
CMD java - jar myapp-1.0-SNAPSHOT.jar



