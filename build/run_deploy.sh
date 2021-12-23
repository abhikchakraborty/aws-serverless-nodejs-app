#!/bin/bash

set -eux -o pipefail

export AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxx

#serverless config credentials --provider aws --key $AWS_ACCESS_KEY_ID secret $AWS_SECRET_ACCESS_KEY
serverless deploy