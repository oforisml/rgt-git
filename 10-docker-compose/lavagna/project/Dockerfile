FROM maven:3.8.6-eclipse-temurin-11-alpine as builder

COPY . /app/

WORKDIR /app

ENV LAVANGNA_EXEC="app/bin"
ENV PATH=$LAVANGNA_EXEC:$PATH

RUN chmod 777 /app/bin/entrypoint.sh

RUN mvn clean stampo:build

ENTRYPOINT ["/app/bin/entrypoint.sh"]
