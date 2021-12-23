#!/bin/bash

set -eux -o pipefail

DOCKER_REPO_BASE="xxxxxxxxxx.dkr.ecr.us-west-2.amazonaws.com/serverless"
SERVERLESS_DEPLOY_DOCKER_IMAGE=$DOCKER_REPO_BASE/deploy:1.0.0

docker run --rm \
$SERVERLESS_DEPLOY_DOCKER_IMAGE