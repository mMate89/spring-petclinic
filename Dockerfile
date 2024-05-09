FROM openjdk:17.0.1-jdk-slim-bullseye as final
COPY target/spring-petclinic-3.2.0-SNAPSHOT.jar ./
EXPOSE 8080
CMD ["java", "-jar", "-Dspring.profiles.active=mysql", "/spring-petclinic-3.2.0-SNAPSHOT.jar"]
