FROM maven:3.5-jdk-8-slim as builder
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml -DskipTests clean package


FROM openjdk:8u181-alpine3.8
COPY --from=builder /usr/src/app/target/my-app-1.0-SNAPSHOT.jar /usr/app/my-app-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/usr/app/my-app-1.0-SNAPSHOT.jar"]