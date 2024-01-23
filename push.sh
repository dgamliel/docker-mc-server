#!/bin/bash +x
DOCKER_USER="dgamliel"

# Build the Docker image
docker build -t minecraft .

# Tag the Docker image
docker tag minecraft:latest ${DOCKER_USER}/minecraft:latest

# Log in to Docker Hub
docker login 

# Push the Docker image to Docker Hub
docker push ${DOCKER_USER}/minecraft:latest