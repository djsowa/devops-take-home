#!/bin/bash

echo "LOGIN....."

cd ../../

pwd
ls

cat './Deployment/Build&Release/app/pass.txt' |docker login --password-stdin -u eco-vadis  https://rancher-eco.westeurope.cloudapp.azure.com:8081

sudo docker-compose -f platform-docker-compose.yml build --pull

sudo docker-compose -f platform-docker-compose.yml push 


##### PLEASE GENERATE ACCESS TOKEN via Rancher and put here to have acces rigth to rancher.
export RANCHER_URL="https://rancher-eco.westeurope.cloudapp.azure.com:8080/" 
export RANCHER_ACCESS_KEY="" 
export RANCHER_SECRET_KEY="" 
export RANCHER_ENVIRONMENT="dev" 

echo "Env:"$RANCHER_ENVIRONMENT
echo "RancherServer:"$RANCHER_URL

sudo docker build . -t eco-platform-release

sudo docker run -e RANCHER_URL \
           -e RANCHER_ACCESS_KEY \
           -e RANCHER_SECRET_KEY \
           -e RANCHER_ENVIRONMENT --rm eco-platform-release