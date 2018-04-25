#!/bin/bash

sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get upgrade -Y
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y

sudo apt-get install docker-ce=17.09.1~ce-0~ubuntu -y

# sudo apt-get install software-properties-common -y
# sudo add-apt-repository ppa:certbot/certbot -y
# sudo apt-get update -y
# sudo apt-get install certbot -y

sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose