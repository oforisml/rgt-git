#!/bin/bash

mysqladmin -h $DB_HOST -u$DB_USER -p$DB_PASS processlist 

while [[ $? -ne 0 ]]
    do
     echo "waiting for db....😍"
    done
echo "database connected ....🤣😤"


mysql -h $DB_HOST -u$DB_USER -p$DB_PASS -e "CREATE DATABASE IF NOT EXISTS lavagna"


java -Xms64m -Xmx128m -Ddatasource.dialect="${DB_DIALECT}" -Ddatasource.url="${DB_URL}" -Ddatasource.username="${DB_USER}" -Ddatasource.password="${DB_PASS}" -Dspring.profiles.active="${SPRING_PROFILE}" -jar ./target/lavagna-jetty-console.war --headless