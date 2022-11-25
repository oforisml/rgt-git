#!/bin/bash

EC2_URL=644435390668.dkr.ecr.us-west-2.amazonaws.com
COMPOSE_PROJECT_NAME="ofori" 


### Version
VERSION="latest"

while getopts "v:" tag
	do
	case ${tag} in
        v) VERSION=${OPTARG}
            ;;
        *) # Invalid option
          echo "no version enterened and hence packaging for VERSION: latest (default)"
          exit
          ;;
     esac
 done

shift $((OPTIND -1))

### Building images
function build_images (){
    docker-compose -f docker-compose.yml build
}


### BUILDING IMAGES
function build_images_from_env (){
    echo "VERSION=${VERSION}" > .env
    echo "COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME}" >> .env

    #Building the function here...
    build_images
}

function tag_built_images(){
    #Tagging images
    docker tag lavagna-docs:${VERSION} ${EC2_URL}/ofori-lavagna-docs:${VERSION}
    docker tag lavagna:${VERSION} ${EC2_URL}/ofori-lavagna:${VERSION}
    docker tag lavagna-proxy:${VERSION} ${EC2_URL}/ofori-lavagna-proxy:${VERSION}
    
}

# To push the containers to AWS
function push_built_images (){
    docker push ${EC2_URL}/ofori-lavagna-docs:${VERSION}
    docker push ${EC2_URL}/ofori-lavagna:${VERSION}
    docker push ${EC2_URL}/ofori-lavagna-proxy:${VERSION}
}

function bundle_starter_pack(){
    tar -zcvf "${COMPOSE_PROJECT_NAME}_${VERSION}".tar.gz ./docker-compose-aws-instance.yml ./starts.sh ./deploy.sh ./.env
    rm -r ./starter_pack/*
    mv ./"${COMPOSE_PROJECT_NAME}_${VERSION}".tar.gz ./starter_pack/
}

function main (){
    echo "BUILD_IMAGES_FROM_ENV"
    build_images_from_env

    echo "Tags"
    tag_built_images

    echo "push"
    push_built_images


    ## Just in case everything works fine, then we bundle the starter pack
    bundle_starter_pack
}

# Running the main method
main



