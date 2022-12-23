FROM maven:3.8.6-eclipse-temurin-11-alpine

ENV OPTIMIZER_SCRIPT="/app/bin"
ENV PATH=$OPTIMIZER_SCRIPT:$PATH

RUN mkdir -p /images/in && mkdir -p images/out
RUN chmod 755 /images/in && chmod 755 /images/out

COPY entry-point.sh /app/bin/entry-point.sh

COPY . /app

RUN chmod 755 /app/bin/entry-point.sh

WORKDIR /app/

RUN mvn install


ENTRYPOINT [ "entry-point.sh" ]
