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

# Go into the ec2-user home dir
cd /home/ec2-user

# Clone the GitHub repository
git clone https://github.com/dgamliel/docker-mc-server

# Change directory into the cloned repository
cd docker-mc-server

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod 777 /usr/bin/docker-compose

#make docker socket accessible cause it's not for some reason
sudo chmod 777 /var/run/docker.sock

# Run Docker Compose
docker-compose up