#!/bin/bash

set -eux -o pipefail

export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0
# should not be hardcoded
export AWS_ACCESS_KEY_ID=xxxxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxx

DOCKER_REPO_BASE="xxxxxxxxx.dkr.ecr.us-west-2.amazonaws.com/serverless"
SERVERLESS_DEPLOY_DOCKER_IMAGE=$DOCKER_REPO_BASE/deploy:1.0.0
SERVERLESS_APP_DOCKER_IMAGE=$DOCKER_REPO_BASE/app:1.0.0

# for aws-cli v-1 use eval $(aws ecr get-login --region us-west-2 --no-include-email) instead
aws --region us-west-2 ecr get-login-password | docker login --username AWS --password-stdin xxxxxxxxx.dkr.ecr.us-west-2.amazonaws.com

function create_app_container() {
    echo "Building app container";
    cd ../app
    docker build -t $SERVERLESS_APP_DOCKER_IMAGE -f ../build/Dockerfile.app .
    echo "Pushing app container image to ecr"
    docker push $SERVERLESS_APP_DOCKER_IMAGE
    cd ../build
}

function create_deploy_container() {
    echo "Building deployment container"
    docker build -t $SERVERLESS_DEPLOY_DOCKER_IMAGE -f Dockerfile.deploy .
    echo "Pushing deploy container image to ecr"
    #docker push $SERVERLESS_DEPLOY_DOCKER_IMAGE
}

create_app_container
create_deploy_container