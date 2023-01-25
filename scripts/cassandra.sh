#! /bin/bash

sudo apt update -y;
sudo apt upgrade -y;
sudo apt install -y docker.io;
sudo systemctl start docker;
sudo systemctl enable docker;
sudo docker run -p 9042:9042 -d -p 7000:7000 cassandra:4 cassandra -fR