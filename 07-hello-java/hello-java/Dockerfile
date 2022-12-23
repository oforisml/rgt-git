FROM maven:3 as mav

WORKDIR /src
COPY . .
RUN mvn verify


FROM openjdk:8-jre-slim

WORKDIR /app
COPY --from=mav /src/target/hello-java.jar .

ENTRYPOINT ["java", "-jar", "hello-java.jar"]
