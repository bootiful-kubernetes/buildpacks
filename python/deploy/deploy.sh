#!/usr/bin/env bash

APP_NAME=python-hello
PROJECT_ID=${GKE_PROJECT:-pgtm-jlong}

cd $(dirname $0)/..
root_dir=$(pwd)

pack build -B heroku/buildpacks:18 $APP_NAME
kubectl create deployment ${APP_NAME} --image=gcr.io/${PROJECT_ID}/${APP_NAME}
kubectl expose deployment ${APP_NAME} --port=80 --target-port=8080 --name=${APP_NAME} --type=LoadBalancer
kubectl describe services $APP_NAME
