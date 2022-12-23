FROM maven:3.6.3-openjdk-8 
WORKDIR /app
COPY . .
RUN chmod +x entrypoint.sh
RUN mv entrypoint.sh /usr/local/sbin
WORKDIR /app/project/ 
RUN mvn clean stampo:build

WORKDIR /app/project/src/target/lavagna/help

ENTRYPOINT ["entrypoint.sh"]