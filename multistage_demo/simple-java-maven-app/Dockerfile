FROM maven:3.5-jdk-8-slim
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml -DskipTests clean package
ENTRYPOINT ["java","-jar","/usr/src/app/target/my-app-1.0-SNAPSHOT.jar"]