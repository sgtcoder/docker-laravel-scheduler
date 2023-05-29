#!/bin/bash

REGISTRY="sgtcoder"
PROJECT_NAME="laravel-scheduler"

docker build --no-cache  -t $REGISTRY/$PROJECT_NAME .
docker push $REGISTRY/$PROJECT_NAME
