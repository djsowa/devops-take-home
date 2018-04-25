#!/bin/bash

echo "LOGIN....."

cd ../../

pwd

cat './Deployment/Build&Release/app/pass.txt' |docker login --password-stdin -u eco-vadis  https://rancher-eco.westeurope.cloudapp.azure.com:8081

sudo docker-compose -f platform-build-compose.yml build --pull

sudo docker-compose -f platform-build-compose.yml push 

export RANCHER_URL="https://rancher-eco.westeurope.cloudapp.azure.com:8080/" 
export RANCHER_ACCESS_KEY="0F42178091E8930937D0" 
export RANCHER_SECRET_KEY="MxbfTJsXkkJ6D35fUjXkCYJ2TtJ3cwQ4cCSbGzha" 
export RANCHER_ENVIRONMENT="dev" 

echo "Env:"$RANCHER_ENVIRONMENT
echo "RancherServer:"$RANCHER_URL

docker build . -t eco-platform-release

docker run -e RANCHER_URL \
           -e RANCHER_ACCESS_KEY \
           -e RANCHER_SECRET_KEY \
           -e RANCHER_ENVIRONMENT --rm eco-platform-release