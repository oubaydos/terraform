#! /bin/bash
sudo touch ~/output.txt
sudo apt update -y
echo "updated" >>~/output.txt
sudo apt upgrade -y
echo "upgraded" >>~/output.txt
sudo apt install -y docker.io
echo "installed docker" >>~/output.txt
sudo systemctl start docker
echo "started docker" >>~/output.txt
sudo systemctl enable docker
echo/ "enabled docker" >>~/output.txt
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
echo "downloaded minikube" >>~/output.txt
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "installed minikube" >>~/output.txt
sudo ln -s $(which minikube) /usr/local/bin/kubectl
echo "linked kubectl" >>~/output.txt

### the part bellow is not successfully starting minikube
sudo -i -u oubay bash <<EOF
sudo usermod -aG docker oubay && newgrp docker;
echo "added user oubay to docker group" >> ~/output.txt;
minikube start;
sudo echo "started minikube" >> ~/output.txt;
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3;
sudo bash ./get_helm.sh;
sudo echo "installed helm" >> ~/output.txt;
helm repo add bitnami https://charts.bitnami.com/bitnami;
sudo echo "added bitnami repo" >> ~/output.txt;
sudo echo "installed kafka" >> ~/output.txt;
EOF
