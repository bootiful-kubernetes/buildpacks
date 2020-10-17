#!/usr/bin/env bash

export APP_NAME=hello-nginx
export PROJECT_ID=${GKE_PROJECT:-pgtm-jlong}

cd $(dirname $0)/..
root_dir=$(pwd)

pack build $APP_NAME --builder  paketobuildpacks/builder:full --buildpack gcr.io/paketo-buildpacks/nginx:latest 

image_id=$(docker images -q $APP_NAME)

docker tag "${image_id}" gcr.io/${PROJECT_ID}/${APP_NAME}
docker push gcr.io/${PROJECT_ID}/${APP_NAME}
docker pull gcr.io/${PROJECT_ID}/${APP_NAME}:latest

kubectl create deployment ${APP_NAME} --image=gcr.io/${PROJECT_ID}/${APP_NAME}
kubectl expose deployment ${APP_NAME} --port=80 --target-port=8080 --name=${APP_NAME} --type=LoadBalancer

kubectl describe services $APP_NAME
