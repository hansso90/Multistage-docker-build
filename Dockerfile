FROM maven:3.5.4-jdk-8 AS build

COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/src/app/target/hello-world-0.0.1-SNAPSHOT.jar"]

FROM azul/zulu-openjdk:8
COPY --from=build /usr/src/app/target/hello-world-0.0.1-SNAPSHOT.jar /usr/app/hello-world-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/hello-world-0.0.1-SNAPSHOT.jar"]