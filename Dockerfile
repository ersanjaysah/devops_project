FROM maven:latest as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:9.0.59-jdk11-openjdk-slim
RUN rm -rf  /usr/local/tomcat/webapps/*
COPY --from=build  /app/target/*.war  /usr/local/tomcat/webapps/ROOT.war
