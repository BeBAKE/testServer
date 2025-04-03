#!/bin/bash

# if ! [ -x "$(command -v docker )" ]; then
#   echo "docker is not installed, installing it"
#   sudo apt update

  sudo apt install curl apt-transport-https ca-certificates software-properties-common

  sudo apt install docker.io -y

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update

  sudo apt install docker-ce -y

  sudo systemctl start docker

  sudo apt install git

  git clone https://github.com/BeBAKE/testServer.git

  cd testServer

  chmod +x my-init.sh

  # sudo docker compose up -d

#   sleep 10




#   exit 1
# fi

echo "starting docker compose up"
sudo docker compose up -d

sleep 5
echo "copying files"
cat ./nginx/afterSSLNginx.txt > ./nginx/nginx.conf

sleep 1
echo "reloading nginx"
sudo docker compose exec nginx nginx -s reload