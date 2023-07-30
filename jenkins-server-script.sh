#!/bin/bash

# install jenkins

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo su -
sudo yum install java -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins

# install git
sudo yum install git -y

# install terraform

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# install kubectl

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin


# install docker
sudo yum update
sudo yum search docker
sudo yum install docker -y

# add the user to the Docker group

sudo usermod -a -G docker ec2-user
id ec2-user

# Reload a Linux user's group assignments to docker w/o logout
newgrp docker

sudo dnf upgrade --releasever=2023.1.20230725 -y
# Add required dependencies for the jenkins package
sudo su -
sudo yum install java -y



# log out and log back in for the group membership to take effect

sudo reboot
