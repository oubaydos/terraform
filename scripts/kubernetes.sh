#! /bin/bash
sudo touch /home/oubay/output.txt
sudo apt update -y
echo "updated" >>/home/oubay/output.txt
sudo apt upgrade -y
echo "upgraded" >>/home/oubay/output.txt
sudo apt install -y docker.io
echo "installed docker" >>/home/oubay/output.txt
sudo systemctl start docker
echo "started docker" >>/home/oubay/output.txt
sudo systemctl enable docker
echo/ "enabled docker" >>/home/oubay/output.txt
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
echo "downloaded minikube" >>/home/oubay/output.txt
sudo install minikube-linux-amd64 /usr/local/bin/minikube
echo "installed minikube" >>/home/oubay/output.txt
sudo ln -s $(which minikube) /usr/local/bin/kubectl
echo "linked kubectl" >>/home/oubay/output.txt
#
#### the part bellow is not successfully starting minikube
#sudo -u oubay -H sh -c 'sudo usermod -aG docker oubay && newgrp docker'
#echo "added user oubay to docker group" >>/home/oubay/output.txt
sudo chmod 666 /var/run/docker.sock;
echo "added permissions to docker socker" >> /home/oubay/output.txt 2>&1;
sudo -u oubay -H sh -c 'minikube start';
echo "started minikube" >>/home/oubay/output.txt 2>&1;

sudo -u oubay -H sh -c 'curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3';
sudo -u oubay -H sh -c 'sudo bash ./get_helm.sh';
echo "installed helm" >>/home/oubay/output.txt 2>&1;
sudo -u oubay -H sh -c 'helm repo add bitnami https://charts.bitnami.com/bitnami';
echo "added bitnami repo" >>/home/oubay/output.txt 2>&1;
sudo -u oubay -H sh -c 'helm install my-release bitnami/kafka',
echo "installed kafka" >>/home/oubay/output.txt 2>&1;

#sudo -i -u oubay bash <<EOF
#sudo usermod -aG docker oubay && newgrp docker;
#echo "added user oubay to docker group" >> /home/oubay/output.txt;
#minikube start;
#sudo echo "started minikube" >> /home/oubay/output.txt;
#curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3;
#sudo bash ./get_helm.sh;
#sudo echo "installed helm" >> /home/oubay/output.txt;
#helm repo add bitnami https://charts.bitnami.com/bitnami;
#sudo echo "added bitnami repo" >> /home/oubay/output.txt;
#sudo echo "installed kafka" >> /home/oubay/output.txt;
#EOF
