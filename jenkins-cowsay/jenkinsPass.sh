#!/bin/bash
image=$1
jk=$2

docker exec -it ${image}  cat /var/jenkins_home/secrets/initialAdminPassword

sudo docker exec -it ${jk} grep 'Password:' /etc/gitlab/initial_root_password
