#!/bin/bash
sudo growpart /dev/nvme0n1 4
sudo lvextend -L +10G /dev/RootVG/rootVol
sudo lvextend -L +10G /dev/RootVG/varVol
sudo lvextend -L +5G /dev/RootVG/homeVol
sudo xfs_growfs /
sudo xfs_growfs /var
sudo xfs_growfs /home

sudo yum install java-21-openjdk -y

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf install -y terraform

sudo dnf module disable nodejs -y
sudo dnf module enable nodejs:20 -y
sudo dnf install nodejs -y
sudo yum install zip -y

#docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl enable --now docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user