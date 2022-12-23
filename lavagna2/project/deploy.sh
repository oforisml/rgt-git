#!/bin/bash

AWS_REPO=ec2-52-25-253-13.us-west-2.compute.amazonaws.com
echo "AWS_REPO=$AWS_REPO" > .env
COMPOSE_PROJECT_NAME=ofori

echo "HERE FIRST"


### Version to deploy
VERSION=""

echo "BEFORE THE GETOPS"

while getopts "v:" tag
	do
	case ${tag} in
        v) VERSION=${OPTARG}
            ;;
         *) # Invalid option
          echo "Usage:::  ./deploy.sh -v <tag> \n./deploy.sh -v 1.2.3"
          exit
          ;;
     esac
 done

shift $((OPTIND -1))


echo "CHECKING FOR THE ECHO"

if [[ -n $VERSION ]]
then
ssh -i ~/.ssh/oregon-pem-key.pem ubuntu@${AWS_REPO} /bin/bash << EOF
        mkdir -p ${COMPOSE_PROJECT_NAME}/${VERSION}
EOF
    scp -r -i ~/.ssh/oregon-pem-key.pem ./starter_pack/${COMPOSE_PROJECT_NAME}_${VERSION}.tar.gz  ubuntu@${AWS_REPO}:~/${COMPOSE_PROJECT_NAME}/${VERSION}
    ssh -i ~/.ssh/oregon-pem-key.pem ubuntu@${AWS_REPO} /bin/bash << EOF
        cd ./${COMPOSE_PROJECT_NAME}/${VERSION}/
        tar -xf ${COMPOSE_PROJECT_NAME}_${VERSION}.tar.gz
        chmod +x starts.sh
        ./starts.sh
EOF
fi

