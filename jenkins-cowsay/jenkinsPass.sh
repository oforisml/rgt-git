#!/bin/bash
image=$1


docker exec -it ${image}  cat /var/jenkins_home/secrets/initialAdminPassword
