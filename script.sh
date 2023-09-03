#!/bin/bash

MY_DIR="/root/Mernstack/"

cd "$MY_DIR"
docker rm -f $(docker ps -a)
docker-compose down

docker-compose up --build -d

echo "Deployment complete."
