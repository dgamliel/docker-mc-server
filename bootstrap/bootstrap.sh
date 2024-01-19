#!/bin/bash

# Update the system
sudo yum update -y

# Install Docker
sudo yum install docker -y

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Install Git
sudo yum install git -y

# Clone the GitHub repository
git clone https://github.com/dgamliel/docker-mc-server/tree/master 
git clone https://github.com/dgamliel/docker-mc-server

# Change directory into the cloned repository
cd docker-mc-server

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#make docker socket accessible cause it's not for some reason
sudo chmod 777 /var/run/docker.sock

# Run Docker Compose
docker-compose up