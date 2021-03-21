FROM openjdk:8-jdk-slim

WORKDIR /application
COPY . .
RUN ./mvnw clean install
EXPOSE 9967

ENTRYPOINT ./mvnw spring-boot:run