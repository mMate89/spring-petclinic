FROM maven:3.8.3-openjdk-17-slim as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:17.0.1-jdk-slim-bullseye as final
COPY --from=builder /app/target/spring-petclinic-3.2.0-SNAPSHOT.jar ./
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic-3.2.0-SNAPSHOT.jar"]
